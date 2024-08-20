import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Haversine Distance function that will calculate the distance between
/// two coordinates and return the shortest distance between these two points
/// in meters

class LocationUtils {
  static double haversineDistance(LatLng currentLocation, LatLng destination) {
    final double lat1 = currentLocation.latitude;
    final double lon1 = currentLocation.longitude;
    final double lat2 = destination.latitude;
    final double lon2 = destination.longitude;

    const double R = 6371e3; // metres
    // var R = 1000;
    final double phi1 = (lat1 * pi) / 180; // φ, λ in radians
    final double phi2 = (lat2 * pi) / 180;
    final double deltaPhi = ((lat2 - lat1) * pi) / 180;
    final double deltaLambda = ((lon2 - lon1) * pi) / 180;

    final double a = sin(deltaPhi / 2) * sin(deltaPhi / 2) +
        cos(phi1) * cos(phi2) *
            sin(deltaLambda / 2) *
            sin(deltaLambda / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    final double d = R * c; // in metres

    return d;
  }
}
