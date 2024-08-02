// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FCMNotification _$FCMNotificationFromJson(Map<String, dynamic> json) {
  return _FCMNotification.fromJson(json);
}

/// @nodoc
mixin _$FCMNotification {
  String get route => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FCMNotificationCopyWith<FCMNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FCMNotificationCopyWith<$Res> {
  factory $FCMNotificationCopyWith(
          FCMNotification value, $Res Function(FCMNotification) then) =
      _$FCMNotificationCopyWithImpl<$Res, FCMNotification>;
  @useResult
  $Res call({String route});
}

/// @nodoc
class _$FCMNotificationCopyWithImpl<$Res, $Val extends FCMNotification>
    implements $FCMNotificationCopyWith<$Res> {
  _$FCMNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_value.copyWith(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FCMNotificationImplCopyWith<$Res>
    implements $FCMNotificationCopyWith<$Res> {
  factory _$$FCMNotificationImplCopyWith(_$FCMNotificationImpl value,
          $Res Function(_$FCMNotificationImpl) then) =
      __$$FCMNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String route});
}

/// @nodoc
class __$$FCMNotificationImplCopyWithImpl<$Res>
    extends _$FCMNotificationCopyWithImpl<$Res, _$FCMNotificationImpl>
    implements _$$FCMNotificationImplCopyWith<$Res> {
  __$$FCMNotificationImplCopyWithImpl(
      _$FCMNotificationImpl _value, $Res Function(_$FCMNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_$FCMNotificationImpl(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FCMNotificationImpl extends _FCMNotification {
  const _$FCMNotificationImpl({required this.route}) : super._();

  factory _$FCMNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FCMNotificationImplFromJson(json);

  @override
  final String route;

  @override
  String toString() {
    return 'FCMNotification(route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FCMNotificationImpl &&
            (identical(other.route, route) || other.route == route));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, route);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FCMNotificationImplCopyWith<_$FCMNotificationImpl> get copyWith =>
      __$$FCMNotificationImplCopyWithImpl<_$FCMNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FCMNotificationImplToJson(
      this,
    );
  }
}

abstract class _FCMNotification extends FCMNotification {
  const factory _FCMNotification({required final String route}) =
      _$FCMNotificationImpl;
  const _FCMNotification._() : super._();

  factory _FCMNotification.fromJson(Map<String, dynamic> json) =
      _$FCMNotificationImpl.fromJson;

  @override
  String get route;
  @override
  @JsonKey(ignore: true)
  _$$FCMNotificationImplCopyWith<_$FCMNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
