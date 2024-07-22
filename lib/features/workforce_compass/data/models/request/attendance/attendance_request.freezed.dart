// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceRequest _$AttendanceRequestFromJson(Map<String, dynamic> json) {
  return _AttendanceRequest.fromJson(json);
}

/// @nodoc
mixin _$AttendanceRequest {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in')
  String? get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_out')
  String? get checkout => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get completed => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceRequestCopyWith<AttendanceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceRequestCopyWith<$Res> {
  factory $AttendanceRequestCopyWith(
          AttendanceRequest value, $Res Function(AttendanceRequest) then) =
      _$AttendanceRequestCopyWithImpl<$Res, AttendanceRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'check_in') String? checkIn,
      @JsonKey(name: 'check_out') String? checkout,
      String? location,
      String? completed,
      String? createdAt});
}

/// @nodoc
class _$AttendanceRequestCopyWithImpl<$Res, $Val extends AttendanceRequest>
    implements $AttendanceRequestCopyWith<$Res> {
  _$AttendanceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? checkIn = freezed,
    Object? checkout = freezed,
    Object? location = freezed,
    Object? completed = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkout: freezed == checkout
          ? _value.checkout
          : checkout // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceRequestImplCopyWith<$Res>
    implements $AttendanceRequestCopyWith<$Res> {
  factory _$$AttendanceRequestImplCopyWith(_$AttendanceRequestImpl value,
          $Res Function(_$AttendanceRequestImpl) then) =
      __$$AttendanceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'check_in') String? checkIn,
      @JsonKey(name: 'check_out') String? checkout,
      String? location,
      String? completed,
      String? createdAt});
}

/// @nodoc
class __$$AttendanceRequestImplCopyWithImpl<$Res>
    extends _$AttendanceRequestCopyWithImpl<$Res, _$AttendanceRequestImpl>
    implements _$$AttendanceRequestImplCopyWith<$Res> {
  __$$AttendanceRequestImplCopyWithImpl(_$AttendanceRequestImpl _value,
      $Res Function(_$AttendanceRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? checkIn = freezed,
    Object? checkout = freezed,
    Object? location = freezed,
    Object? completed = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$AttendanceRequestImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkout: freezed == checkout
          ? _value.checkout
          : checkout // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceRequestImpl extends _AttendanceRequest {
  const _$AttendanceRequestImpl(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'check_in') this.checkIn,
      @JsonKey(name: 'check_out') this.checkout,
      this.location,
      this.completed,
      this.createdAt})
      : super._();

  factory _$AttendanceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceRequestImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'check_in')
  final String? checkIn;
  @override
  @JsonKey(name: 'check_out')
  final String? checkout;
  @override
  final String? location;
  @override
  final String? completed;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'AttendanceRequest(id: $id, checkIn: $checkIn, checkout: $checkout, location: $location, completed: $completed, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkout, checkout) ||
                other.checkout == checkout) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, checkIn, checkout, location, completed, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceRequestImplCopyWith<_$AttendanceRequestImpl> get copyWith =>
      __$$AttendanceRequestImplCopyWithImpl<_$AttendanceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceRequestImplToJson(
      this,
    );
  }
}

abstract class _AttendanceRequest extends AttendanceRequest {
  const factory _AttendanceRequest(
      {@JsonKey(name: '_id') final String? id,
      @JsonKey(name: 'check_in') final String? checkIn,
      @JsonKey(name: 'check_out') final String? checkout,
      final String? location,
      final String? completed,
      final String? createdAt}) = _$AttendanceRequestImpl;
  const _AttendanceRequest._() : super._();

  factory _AttendanceRequest.fromJson(Map<String, dynamic> json) =
      _$AttendanceRequestImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'check_in')
  String? get checkIn;
  @override
  @JsonKey(name: 'check_out')
  String? get checkout;
  @override
  String? get location;
  @override
  String? get completed;
  @override
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceRequestImplCopyWith<_$AttendanceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
