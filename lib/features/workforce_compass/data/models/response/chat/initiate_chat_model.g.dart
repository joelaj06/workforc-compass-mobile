// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitiateChatImpl _$$InitiateChatImplFromJson(Map<String, dynamic> json) =>
    _$InitiateChatImpl(
      isNew: json['isNew'] as bool,
      message: json['message'] as String,
      chatRoomId: json['chat_room_id'] as String,
    );

Map<String, dynamic> _$$InitiateChatImplToJson(_$InitiateChatImpl instance) =>
    <String, dynamic>{
      'isNew': instance.isNew,
      'message': instance.message,
      'chat_room_id': instance.chatRoomId,
    };
