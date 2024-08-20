// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeoLocationImpl _$$GeoLocationImplFromJson(Map<String, dynamic> json) =>
    _$GeoLocationImpl(
      long: (json['long'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      address: json['address'] as String?,
      radius: (json['radius'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GeoLocationImplToJson(_$GeoLocationImpl instance) =>
    <String, dynamic>{
      'long': instance.long,
      'lat': instance.lat,
      'address': instance.address,
      'radius': instance.radius,
    };
