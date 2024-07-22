// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radius_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Radius _$RadiusFromJson(Map<String, dynamic> json) {
  return _Radius.fromJson(json);
}

/// @nodoc
mixin _$Radius {
  int get radius => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RadiusCopyWith<Radius> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadiusCopyWith<$Res> {
  factory $RadiusCopyWith(Radius value, $Res Function(Radius) then) =
      _$RadiusCopyWithImpl<$Res, Radius>;
  @useResult
  $Res call({int radius, String label});
}

/// @nodoc
class _$RadiusCopyWithImpl<$Res, $Val extends Radius>
    implements $RadiusCopyWith<$Res> {
  _$RadiusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radius = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RadiusImplCopyWith<$Res> implements $RadiusCopyWith<$Res> {
  factory _$$RadiusImplCopyWith(
          _$RadiusImpl value, $Res Function(_$RadiusImpl) then) =
      __$$RadiusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int radius, String label});
}

/// @nodoc
class __$$RadiusImplCopyWithImpl<$Res>
    extends _$RadiusCopyWithImpl<$Res, _$RadiusImpl>
    implements _$$RadiusImplCopyWith<$Res> {
  __$$RadiusImplCopyWithImpl(
      _$RadiusImpl _value, $Res Function(_$RadiusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radius = null,
    Object? label = null,
  }) {
    return _then(_$RadiusImpl(
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RadiusImpl extends _Radius {
  const _$RadiusImpl({required this.radius, required this.label}) : super._();

  factory _$RadiusImpl.fromJson(Map<String, dynamic> json) =>
      _$$RadiusImplFromJson(json);

  @override
  final int radius;
  @override
  final String label;

  @override
  String toString() {
    return 'Radius(radius: $radius, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadiusImpl &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, radius, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadiusImplCopyWith<_$RadiusImpl> get copyWith =>
      __$$RadiusImplCopyWithImpl<_$RadiusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RadiusImplToJson(
      this,
    );
  }
}

abstract class _Radius extends Radius {
  const factory _Radius(
      {required final int radius, required final String label}) = _$RadiusImpl;
  const _Radius._() : super._();

  factory _Radius.fromJson(Map<String, dynamic> json) = _$RadiusImpl.fromJson;

  @override
  int get radius;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$RadiusImplCopyWith<_$RadiusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
