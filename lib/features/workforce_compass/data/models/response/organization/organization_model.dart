// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/organization/geolocation_model.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/organization/radius_model.dart';


part 'organization_model.freezed.dart';
part 'organization_model.g.dart';

@freezed
class Organization with _$Organization {
  const factory Organization({
    @JsonKey(name: '_id') required String? id,
    required String name,
    String? description,
    String? code,
    @JsonKey(name: 'arrival_time') String? arrivalTime,
    @JsonKey(name: 'departure_time') String? departureTime,
    String? motto,
    String? logo,
    required Radius radius,
    required GeoLocation location,

  }) = _Organization;

  const Organization._();

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
  factory Organization.empty() =>  Organization(id: '', name: '',
  radius: Radius.empty(),
  location: GeoLocation.empty(),);

}
