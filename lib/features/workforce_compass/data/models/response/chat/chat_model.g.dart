// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      id: json['_id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      initiator: json['initiator'] == null
          ? null
          : User.fromJson(json['initiator'] as Map<String, dynamic>),
      lastMessage: json['last_message'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'initiator': instance.initiator,
      'last_message': instance.lastMessage,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
