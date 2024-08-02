// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initiate_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InitiateChat _$InitiateChatFromJson(Map<String, dynamic> json) {
  return _InitiateChat.fromJson(json);
}

/// @nodoc
mixin _$InitiateChat {
  bool get isNew => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'chat_room_id')
  String get chatRoomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InitiateChatCopyWith<InitiateChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitiateChatCopyWith<$Res> {
  factory $InitiateChatCopyWith(
          InitiateChat value, $Res Function(InitiateChat) then) =
      _$InitiateChatCopyWithImpl<$Res, InitiateChat>;
  @useResult
  $Res call(
      {bool isNew,
      String message,
      @JsonKey(name: 'chat_room_id') String chatRoomId});
}

/// @nodoc
class _$InitiateChatCopyWithImpl<$Res, $Val extends InitiateChat>
    implements $InitiateChatCopyWith<$Res> {
  _$InitiateChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNew = null,
    Object? message = null,
    Object? chatRoomId = null,
  }) {
    return _then(_value.copyWith(
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitiateChatImplCopyWith<$Res>
    implements $InitiateChatCopyWith<$Res> {
  factory _$$InitiateChatImplCopyWith(
          _$InitiateChatImpl value, $Res Function(_$InitiateChatImpl) then) =
      __$$InitiateChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isNew,
      String message,
      @JsonKey(name: 'chat_room_id') String chatRoomId});
}

/// @nodoc
class __$$InitiateChatImplCopyWithImpl<$Res>
    extends _$InitiateChatCopyWithImpl<$Res, _$InitiateChatImpl>
    implements _$$InitiateChatImplCopyWith<$Res> {
  __$$InitiateChatImplCopyWithImpl(
      _$InitiateChatImpl _value, $Res Function(_$InitiateChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNew = null,
    Object? message = null,
    Object? chatRoomId = null,
  }) {
    return _then(_$InitiateChatImpl(
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InitiateChatImpl extends _InitiateChat {
  const _$InitiateChatImpl(
      {required this.isNew,
      required this.message,
      @JsonKey(name: 'chat_room_id') required this.chatRoomId})
      : super._();

  factory _$InitiateChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitiateChatImplFromJson(json);

  @override
  final bool isNew;
  @override
  final String message;
  @override
  @JsonKey(name: 'chat_room_id')
  final String chatRoomId;

  @override
  String toString() {
    return 'InitiateChat(isNew: $isNew, message: $message, chatRoomId: $chatRoomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateChatImpl &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isNew, message, chatRoomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitiateChatImplCopyWith<_$InitiateChatImpl> get copyWith =>
      __$$InitiateChatImplCopyWithImpl<_$InitiateChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InitiateChatImplToJson(
      this,
    );
  }
}

abstract class _InitiateChat extends InitiateChat {
  const factory _InitiateChat(
          {required final bool isNew,
          required final String message,
          @JsonKey(name: 'chat_room_id') required final String chatRoomId}) =
      _$InitiateChatImpl;
  const _InitiateChat._() : super._();

  factory _InitiateChat.fromJson(Map<String, dynamic> json) =
      _$InitiateChatImpl.fromJson;

  @override
  bool get isNew;
  @override
  String get message;
  @override
  @JsonKey(name: 'chat_room_id')
  String get chatRoomId;
  @override
  @JsonKey(ignore: true)
  _$$InitiateChatImplCopyWith<_$InitiateChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
