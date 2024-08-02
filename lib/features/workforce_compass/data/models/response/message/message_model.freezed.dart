// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'recipient')
  User? get receiver => throw _privateConstructorUsedError;
  String? get chat => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  MessageContent get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'recipient') User? receiver,
      String? chat,
      String? createdAt,
      String? updatedAt,
      String? type,
      String? status,
      @JsonKey(name: 'content') MessageContent message});

  $UserCopyWith<$Res>? get receiver;
  $MessageContentCopyWith<$Res> get message;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiver = freezed,
    Object? chat = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiver: freezed == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as User?,
      chat: freezed == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageContent,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get receiver {
    if (_value.receiver == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.receiver!, (value) {
      return _then(_value.copyWith(receiver: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageContentCopyWith<$Res> get message {
    return $MessageContentCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'recipient') User? receiver,
      String? chat,
      String? createdAt,
      String? updatedAt,
      String? type,
      String? status,
      @JsonKey(name: 'content') MessageContent message});

  @override
  $UserCopyWith<$Res>? get receiver;
  @override
  $MessageContentCopyWith<$Res> get message;
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiver = freezed,
    Object? chat = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? message = null,
  }) {
    return _then(_$MessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiver: freezed == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as User?,
      chat: freezed == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageContent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl extends _Message {
  const _$MessageImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'recipient') required this.receiver,
      this.chat,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.status,
      @JsonKey(name: 'content') required this.message})
      : super._();

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'recipient')
  final User? receiver;
  @override
  final String? chat;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? type;
  @override
  final String? status;
  @override
  @JsonKey(name: 'content')
  final MessageContent message;

  @override
  String toString() {
    return 'Message(id: $id, receiver: $receiver, chat: $chat, createdAt: $createdAt, updatedAt: $updatedAt, type: $type, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver) &&
            (identical(other.chat, chat) || other.chat == chat) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, receiver, chat, createdAt,
      updatedAt, type, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message extends Message {
  const factory _Message(
          {@JsonKey(name: '_id') required final String id,
          @JsonKey(name: 'recipient') required final User? receiver,
          final String? chat,
          final String? createdAt,
          final String? updatedAt,
          final String? type,
          final String? status,
          @JsonKey(name: 'content') required final MessageContent message}) =
      _$MessageImpl;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'recipient')
  User? get receiver;
  @override
  String? get chat;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get type;
  @override
  String? get status;
  @override
  @JsonKey(name: 'content')
  MessageContent get message;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
