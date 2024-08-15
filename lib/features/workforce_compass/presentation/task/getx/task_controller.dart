import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:work_compass/core/presentation/theme/primary_color.dart';

import '../../../data/datasources/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TaskController extends GetxController{

  RxString currentDate = ''.obs;
  RxString currentTime = ''.obs;
  RxString currentLocation = 'Current Location'.obs;
  RxBool isloadingCurrentLocation = false.obs;
  RxInt pageIndex = 0.obs;
  final RxMap<String, Marker> markers = <String, Marker>{}.obs;
  final RxMap<String, Circle> circles = <String, Circle>{}.obs;
  

  PageController pageController = PageController(initialPage: 0);
  LocationService locationService = LocationService();
  late GoogleMapController googleMapController;


  @override
  void onInit() {
    runCurrentTime();

    super.onInit();
  }


  void addMarker(String id, LatLng position) {
    markers[id] = Marker(
      markerId: MarkerId(id),
      position: position,
    );
  }

  void addCircle(String id, LatLng position, double radius) {
    circles[id] = Circle(
      circleId: CircleId(id),
      center: position,
      radius: radius,
      strokeWidth: 2,
      strokeColor: PrimaryColor.color,
      fillColor: PrimaryColor.color.withOpacity(0.2),
    );
  }
  void onPageIndexChanged(int index){
    pageIndex(index);
  }

  void navigatePages(int page){
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
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

  Future<String> getPlaceMarkFromCoordinates(double lat, double lng) async {
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      lat, lng
    );
    final Placemark place = placemarks[0];
    return '${place.street} - ${place.locality}, ${place.country}';
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


}