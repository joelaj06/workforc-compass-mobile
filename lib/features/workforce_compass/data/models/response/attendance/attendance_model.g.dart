// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceImpl _$$AttendanceImplFromJson(Map<String, dynamic> json) =>
    _$AttendanceImpl(
      id: json['_id'] as String,
      startDate: json['start_date'] as String?,
      checkIn: json['check_in'] as String?,
      checkout: json['check_out'] as String?,
      workingHrs: json['workingHrs'] as String?,
      location: json['location'] as String?,
      hasCheckedIn: json['is_checked_in'] as bool?,
      completed: json['completed'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$AttendanceImplToJson(_$AttendanceImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'start_date': instance.startDate,
      'check_in': instance.checkIn,
      'check_out': instance.checkout,
      'workingHrs': instance.workingHrs,
      'location': instance.location,
      'is_checked_in': instance.hasCheckedIn,
      'completed': instance.completed,
      'createdAt': instance.createdAt,
    };
