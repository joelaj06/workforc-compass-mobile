import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:work_compass/core/presentation/theme/primary_color.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/task/task_model.dart';

import '../../../data/datasources/location_service.dart';

class TaskController extends GetxController {
  RxString currentDate = ''.obs;
  RxString currentTime = ''.obs;
  RxString currentLocation = 'Current Location'.obs;
  RxBool isloadingCurrentLocation = false.obs;
  RxInt pageIndex = 0.obs;
  final RxMap<String, Marker> markers = <String, Marker>{}.obs;
  final RxMap<String, Circle> circles = <String, Circle>{}.obs;
  Rx<LatLng> currentPosition = const LatLng(0, 0).obs;
  Rx<Task> task = Task.empty().obs;
  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;
  late bool isLoaded;

  PageController pageController = PageController(initialPage: 0);
  LocationService locationService = LocationService();
  Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();

  Location location = Location();

  @override
  void onInit() {
    isLoaded = false;
    runCurrentTime();
    getLocationUpdate();
    super.onInit();
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) {
    const PolylineId id = PolylineId('poly');
    final Polyline polyline = Polyline(
      polylineId: id,
      color: PrimaryColor.color,
      points: polylineCoordinates,
    );
    polylines[id] = polyline;
  }

  Future<List<LatLng>> getPolyline(LatLng start, LatLng end) async {
    final List<LatLng> polylineCoordinates = <LatLng>[];
    final PolylinePoints polylinePoints = PolylinePoints();
    final PolylineResult result =
        await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: FlutterConfig.get('GOOGLE_MAPS_API_KEY').toString(),
      request: PolylineRequest(
        origin: PointLatLng(
            currentPosition.value.latitude, currentPosition.value.longitude),
        destination: PointLatLng(end.latitude, end.longitude),
        mode: TravelMode.driving,
      ),
    );

    if (result.points.isNotEmpty) {
      for (final PointLatLng point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
    }
    return polylineCoordinates;
  }

  void cameraToPosition(LatLng position) async {
    final GoogleMapController controller = await googleMapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: position,
          zoom: 15,
        ),
      ),
    );
  }

  Future<void> getLocationUpdate() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.onLocationChanged.listen((LocationData currentLocation) async {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        currentPosition(
          LatLng(currentLocation.latitude!, currentLocation.longitude!),
        );
        cameraToPosition(currentPosition.value);

        if (isLoaded == false) {
          if ((currentPosition.value.latitude != 0 &&
              currentPosition.value.longitude != 0)) {
            await getPolyline(
              currentPosition.value,
              LatLng(task.value.location?.lat ?? 0,
                  task.value.location?.long ?? 0),
            ).then((List<LatLng> coordinates) {
              generatePolyLineFromPoints(coordinates);
            });
          }
          isLoaded = true;
        }
      }
    });
  }

  void addMarker(String id, LatLng position, BitmapDescriptor? icon) {
    markers[id] = Marker(
        markerId: MarkerId(id),
        position: position,
        icon: icon ?? BitmapDescriptor.defaultMarker);
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

  void onPageIndexChanged(int index) {
    pageIndex(index);
  }

  void navigatePages(int page) {
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
    final List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
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
