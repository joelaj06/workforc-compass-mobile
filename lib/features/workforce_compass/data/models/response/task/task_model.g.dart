// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      location: json['location'] == null
          ? null
          : GeoLocation.fromJson(json['location'] as Map<String, dynamic>),
      description: json['description'] as String?,
      assignee: json['assignee'] == null
          ? null
          : User.fromJson(json['assignee'] as Map<String, dynamic>),
      reviewer: json['reviewer'] == null
          ? null
          : User.fromJson(json['reviewer'] as Map<String, dynamic>),
      status: json['status'] as String?,
      dueDate: json['due_date'] as String?,
      startDate: json['start_date'] as String?,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'location': instance.location,
      'description': instance.description,
      'assignee': instance.assignee,
      'reviewer': instance.reviewer,
      'status': instance.status,
      'due_date': instance.dueDate,
      'start_date': instance.startDate,
    };
