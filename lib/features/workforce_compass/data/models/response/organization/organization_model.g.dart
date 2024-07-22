// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationImpl _$$OrganizationImplFromJson(Map<String, dynamic> json) =>
    _$OrganizationImpl(
      id: json['_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      code: json['code'] as String?,
      arrivalTime: json['arrival_time'] as String?,
      departureTime: json['departure_time'] as String?,
      motto: json['motto'] as String?,
      logo: json['logo'] as String?,
      radius: Radius.fromJson(json['radius'] as Map<String, dynamic>),
      location: GeoLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrganizationImplToJson(_$OrganizationImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'code': instance.code,
      'arrival_time': instance.arrivalTime,
      'departure_time': instance.departureTime,
      'motto': instance.motto,
      'logo': instance.logo,
      'radius': instance.radius,
      'location': instance.location,
    };
