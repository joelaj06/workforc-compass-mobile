// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      assignee: json['assignee'] == null
          ? null
          : User.fromJson(json['assignee'] as Map<String, dynamic>),
      startDate: json['startDate'] as String?,
      reviewer: json['reviewer'] == null
          ? null
          : User.fromJson(json['reviewer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'assignee': instance.assignee,
      'startDate': instance.startDate,
      'reviewer': instance.reviewer,
    };
