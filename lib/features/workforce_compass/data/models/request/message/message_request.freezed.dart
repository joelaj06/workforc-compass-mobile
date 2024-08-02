// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageRequest _$MessageRequestFromJson(Map<String, dynamic> json) {
  return _MessageRequest.fromJson(json);
}

/// @nodoc
mixin _$MessageRequest {
  String? get chatId => throw _privateConstructorUsedError;
  String get recipient => throw _privateConstructorUsedError;
  String? get senderId => throw _privateConstructorUsedError;
  MessageContent get message => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'fcm_notification')
  FCMNotification? get notification => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageRequestCopyWith<MessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageRequestCopyWith<$Res> {
  factory $MessageRequestCopyWith(
          MessageRequest value, $Res Function(MessageRequest) then) =
      _$MessageRequestCopyWithImpl<$Res, MessageRequest>;
  @useResult
  $Res call(
      {String? chatId,
      String recipient,
      String? senderId,
      MessageContent message,
      bool? isRead,
      String? date,
      @JsonKey(name: 'fcm_notification') FCMNotification? notification});

  $MessageContentCopyWith<$Res> get message;
  $FCMNotificationCopyWith<$Res>? get notification;
}

/// @nodoc
class _$MessageRequestCopyWithImpl<$Res, $Val extends MessageRequest>
    implements $MessageRequestCopyWith<$Res> {
  _$MessageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = freezed,
    Object? recipient = null,
    Object? senderId = freezed,
    Object? message = null,
    Object? isRead = freezed,
    Object? date = freezed,
    Object? notification = freezed,
  }) {
    return _then(_value.copyWith(
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String?,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageContent,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as FCMNotification?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageContentCopyWith<$Res> get message {
    return $MessageContentCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FCMNotificationCopyWith<$Res>? get notification {
    if (_value.notification == null) {
      return null;
    }

    return $FCMNotificationCopyWith<$Res>(_value.notification!, (value) {
      return _then(_value.copyWith(notification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageRequestImplCopyWith<$Res>
    implements $MessageRequestCopyWith<$Res> {
  factory _$$MessageRequestImplCopyWith(_$MessageRequestImpl value,
          $Res Function(_$MessageRequestImpl) then) =
      __$$MessageRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? chatId,
      String recipient,
      String? senderId,
      MessageContent message,
      bool? isRead,
      String? date,
      @JsonKey(name: 'fcm_notification') FCMNotification? notification});

  @override
  $MessageContentCopyWith<$Res> get message;
  @override
  $FCMNotificationCopyWith<$Res>? get notification;
}

/// @nodoc
class __$$MessageRequestImplCopyWithImpl<$Res>
    extends _$MessageRequestCopyWithImpl<$Res, _$MessageRequestImpl>
    implements _$$MessageRequestImplCopyWith<$Res> {
  __$$MessageRequestImplCopyWithImpl(
      _$MessageRequestImpl _value, $Res Function(_$MessageRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = freezed,
    Object? recipient = null,
    Object? senderId = freezed,
    Object? message = null,
    Object? isRead = freezed,
    Object? date = freezed,
    Object? notification = freezed,
  }) {
    return _then(_$MessageRequestImpl(
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String?,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageContent,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as FCMNotification?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageRequestImpl extends _MessageRequest {
  const _$MessageRequestImpl(
      {this.chatId,
      required this.recipient,
      this.senderId,
      required this.message,
      this.isRead,
      this.date,
      @JsonKey(name: 'fcm_notification') this.notification})
      : super._();

  factory _$MessageRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageRequestImplFromJson(json);

  @override
  final String? chatId;
  @override
  final String recipient;
  @override
  final String? senderId;
  @override
  final MessageContent message;
  @override
  final bool? isRead;
  @override
  final String? date;
  @override
  @JsonKey(name: 'fcm_notification')
  final FCMNotification? notification;

  @override
  String toString() {
    return 'MessageRequest(chatId: $chatId, recipient: $recipient, senderId: $senderId, message: $message, isRead: $isRead, date: $date, notification: $notification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageRequestImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chatId, recipient, senderId,
      message, isRead, date, notification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageRequestImplCopyWith<_$MessageRequestImpl> get copyWith =>
      __$$MessageRequestImplCopyWithImpl<_$MessageRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageRequestImplToJson(
      this,
    );
  }
}

abstract class _MessageRequest extends MessageRequest {
  const factory _MessageRequest(
      {final String? chatId,
      required final String recipient,
      final String? senderId,
      required final MessageContent message,
      final bool? isRead,
      final String? date,
      @JsonKey(name: 'fcm_notification')
      final FCMNotification? notification}) = _$MessageRequestImpl;
  const _MessageRequest._() : super._();

  factory _MessageRequest.fromJson(Map<String, dynamic> json) =
      _$MessageRequestImpl.fromJson;

  @override
  String? get chatId;
  @override
  String get recipient;
  @override
  String? get senderId;
  @override
  MessageContent get message;
  @override
  bool? get isRead;
  @override
  String? get date;
  @override
  @JsonKey(name: 'fcm_notification')
  FCMNotification? get notification;
  @override
  @JsonKey(ignore: true)
  _$$MessageRequestImplCopyWith<_$MessageRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
