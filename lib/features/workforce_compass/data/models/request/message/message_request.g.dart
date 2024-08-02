// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageRequestImpl _$$MessageRequestImplFromJson(Map<String, dynamic> json) =>
    _$MessageRequestImpl(
      chatId: json['chatId'] as String?,
      recipient: json['recipient'] as String,
      senderId: json['senderId'] as String?,
      message: MessageContent.fromJson(json['message'] as Map<String, dynamic>),
      isRead: json['isRead'] as bool?,
      date: json['date'] as String?,
      notification: json['fcm_notification'] == null
          ? null
          : FCMNotification.fromJson(
              json['fcm_notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageRequestImplToJson(
        _$MessageRequestImpl instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'recipient': instance.recipient,
      'senderId': instance.senderId,
      'message': instance.message,
      'isRead': instance.isRead,
      'date': instance.date,
      'fcm_notification': instance.notification,
    };
