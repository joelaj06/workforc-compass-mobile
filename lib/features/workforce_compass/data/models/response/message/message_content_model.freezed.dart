// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageContent _$MessageContentFromJson(Map<String, dynamic> json) {
  return _MessageContent.fromJson(json);
}

/// @nodoc
mixin _$MessageContent {
  @JsonKey(name: 'message_text')
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageContentCopyWith<MessageContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageContentCopyWith<$Res> {
  factory $MessageContentCopyWith(
          MessageContent value, $Res Function(MessageContent) then) =
      _$MessageContentCopyWithImpl<$Res, MessageContent>;
  @useResult
  $Res call({@JsonKey(name: 'message_text') String text});
}

/// @nodoc
class _$MessageContentCopyWithImpl<$Res, $Val extends MessageContent>
    implements $MessageContentCopyWith<$Res> {
  _$MessageContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageContentImplCopyWith<$Res>
    implements $MessageContentCopyWith<$Res> {
  factory _$$MessageContentImplCopyWith(_$MessageContentImpl value,
          $Res Function(_$MessageContentImpl) then) =
      __$$MessageContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'message_text') String text});
}

/// @nodoc
class __$$MessageContentImplCopyWithImpl<$Res>
    extends _$MessageContentCopyWithImpl<$Res, _$MessageContentImpl>
    implements _$$MessageContentImplCopyWith<$Res> {
  __$$MessageContentImplCopyWithImpl(
      _$MessageContentImpl _value, $Res Function(_$MessageContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$MessageContentImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageContentImpl extends _MessageContent {
  const _$MessageContentImpl(
      {@JsonKey(name: 'message_text') required this.text})
      : super._();

  factory _$MessageContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageContentImplFromJson(json);

  @override
  @JsonKey(name: 'message_text')
  final String text;

  @override
  String toString() {
    return 'MessageContent(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageContentImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageContentImplCopyWith<_$MessageContentImpl> get copyWith =>
      __$$MessageContentImplCopyWithImpl<_$MessageContentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageContentImplToJson(
      this,
    );
  }
}

abstract class _MessageContent extends MessageContent {
  const factory _MessageContent(
          {@JsonKey(name: 'message_text') required final String text}) =
      _$MessageContentImpl;
  const _MessageContent._() : super._();

  factory _MessageContent.fromJson(Map<String, dynamic> json) =
      _$MessageContentImpl.fromJson;

  @override
  @JsonKey(name: 'message_text')
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$MessageContentImplCopyWith<_$MessageContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
