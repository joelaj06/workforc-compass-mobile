import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:work_compass/core/errors/errors.dart';
import 'package:work_compass/core/presentation/routes/app_routes.dart';
import 'package:work_compass/core/usecase/usecase.dart';
import 'package:work_compass/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:work_compass/features/workforce_compass/data/datasources/location_service.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/organization/organization_model.dart';
import 'package:work_compass/features/workforce_compass/domain/usecases/organization/fetch_organization.dart';

import '../../../../authentication/data/models/response/login/login_response.dart';

class HomeController extends GetxController {
  HomeController({required this.fetchOrganization});

  final FetchOrganization fetchOrganization;

  //reactive variables
  Rx<Organization> organization = Organization.empty().obs;
  RxString currentDate = ''.obs;
  RxString currentTime = ''.obs;
  RxString currentLocation = 'Current Location'.obs;
  RxBool isloadingCurrentLocation = false.obs;
  Rx<LoginResponse> user = LoginResponse.empty().obs;

  LocationService locationService = LocationService();
  final AuthLocalDataSource _authLocalDataSource = Get.find();

  @override
  void onInit() {
    runCurrentTime();
    getOrganization();
    getUser();
    super.onInit();
  }

  void navigateToTaskScreen(){
    //Get.toNamed<dynamic>(AppRoutes.task);
    print('tapped');
  }
  void getCurrentLocation() async {
    isloadingCurrentLocation(true);
    final Position position = await locationService.determinePosition();
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    final Placemark placemark = placemarks.first;
    final String loc =
        '${placemark.street} - ${placemark.locality}, ${placemark.country}';
    isloadingCurrentLocation(false);
    currentLocation(loc);
  }

  void runCurrentTime() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      final String formattedDate =
          DateFormat('EEEE, MMM d').format(DateTime.now());
      currentDate(formattedDate);
      final String formattedTime = DateFormat('HH:mm a').format(DateTime.now());
      currentTime(formattedTime);
    });
  }

  void getOrganization() async {
    final Either<Failure, Organization> failureOrganization =
        await fetchOrganization(NoParams());

    failureOrganization.fold((Failure failure) {}, (Organization org) {
      organization(org);
    });
  }

  Future<LoginResponse?> getUser() async {
    final LoginResponse? response = _authLocalDataSource.authResponse ??
        await _authLocalDataSource.getAuthResponse();
    user(response);
    return response;
  }
}
