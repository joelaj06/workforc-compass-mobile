// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../response/message/message_content_model.dart';
import '../notification/notification.dart';

part 'message_request.freezed.dart';
part 'message_request.g.dart';

@freezed
class MessageRequest with _$MessageRequest {
  const factory MessageRequest({
    String? chatId,
    required String recipient,
    String? senderId,
    required MessageContent message,
    bool? isRead,
    String? date,
    @JsonKey(name: 'fcm_notification') FCMNotification? notification,
  }) = _MessageRequest;

  const MessageRequest._();

  factory MessageRequest.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestFromJson(json);

}
