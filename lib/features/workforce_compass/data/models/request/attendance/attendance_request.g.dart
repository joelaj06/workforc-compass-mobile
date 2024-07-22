// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceRequestImpl _$$AttendanceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceRequestImpl(
      id: json['_id'] as String?,
      checkIn: json['check_in'] as String?,
      checkout: json['check_out'] as String?,
      location: json['location'] as String?,
      completed: json['completed'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$AttendanceRequestImplToJson(
        _$AttendanceRequestImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'check_in': instance.checkIn,
      'check_out': instance.checkout,
      'location': instance.location,
      'completed': instance.completed,
      'createdAt': instance.createdAt,
    };
