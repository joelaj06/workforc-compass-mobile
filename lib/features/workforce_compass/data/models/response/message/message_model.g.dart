// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['_id'] as String,
      receiver: json['recipient'] == null
          ? null
          : User.fromJson(json['recipient'] as Map<String, dynamic>),
      chat: json['chat'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      message: MessageContent.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'recipient': instance.receiver,
      'chat': instance.chat,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'type': instance.type,
      'status': instance.status,
      'content': instance.message,
    };
