// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'geolocation_model.freezed.dart';
part 'geolocation_model.g.dart';

@freezed
class GeoLocation with _$GeoLocation {
  const factory GeoLocation({
   required String long,
    required String lat,
  }) = _GeoLocation;

  const GeoLocation._();

  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);

  factory GeoLocation.empty() =>  const GeoLocation(
    long: '',
    lat: '',
  );
}
