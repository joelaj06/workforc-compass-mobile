// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return _Organization.fromJson(json);
}

/// @nodoc
mixin _$Organization {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'arrival_time')
  String? get arrivalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'departure_time')
  String? get departureTime => throw _privateConstructorUsedError;
  String? get motto => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  Radius get radius => throw _privateConstructorUsedError;
  GeoLocation get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationCopyWith<Organization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationCopyWith<$Res> {
  factory $OrganizationCopyWith(
          Organization value, $Res Function(Organization) then) =
      _$OrganizationCopyWithImpl<$Res, Organization>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String name,
      String? description,
      String? code,
      @JsonKey(name: 'arrival_time') String? arrivalTime,
      @JsonKey(name: 'departure_time') String? departureTime,
      String? motto,
      String? logo,
      Radius radius,
      GeoLocation location});

  $RadiusCopyWith<$Res> get radius;
  $GeoLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$OrganizationCopyWithImpl<$Res, $Val extends Organization>
    implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? code = freezed,
    Object? arrivalTime = freezed,
    Object? departureTime = freezed,
    Object? motto = freezed,
    Object? logo = freezed,
    Object? radius = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalTime: freezed == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as String?,
      departureTime: freezed == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String?,
      motto: freezed == motto
          ? _value.motto
          : motto // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as Radius,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RadiusCopyWith<$Res> get radius {
    return $RadiusCopyWith<$Res>(_value.radius, (value) {
      return _then(_value.copyWith(radius: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoLocationCopyWith<$Res> get location {
    return $GeoLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrganizationImplCopyWith<$Res>
    implements $OrganizationCopyWith<$Res> {
  factory _$$OrganizationImplCopyWith(
          _$OrganizationImpl value, $Res Function(_$OrganizationImpl) then) =
      __$$OrganizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String name,
      String? description,
      String? code,
      @JsonKey(name: 'arrival_time') String? arrivalTime,
      @JsonKey(name: 'departure_time') String? departureTime,
      String? motto,
      String? logo,
      Radius radius,
      GeoLocation location});

  @override
  $RadiusCopyWith<$Res> get radius;
  @override
  $GeoLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$OrganizationImplCopyWithImpl<$Res>
    extends _$OrganizationCopyWithImpl<$Res, _$OrganizationImpl>
    implements _$$OrganizationImplCopyWith<$Res> {
  __$$OrganizationImplCopyWithImpl(
      _$OrganizationImpl _value, $Res Function(_$OrganizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? code = freezed,
    Object? arrivalTime = freezed,
    Object? departureTime = freezed,
    Object? motto = freezed,
    Object? logo = freezed,
    Object? radius = null,
    Object? location = null,
  }) {
    return _then(_$OrganizationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalTime: freezed == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as String?,
      departureTime: freezed == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String?,
      motto: freezed == motto
          ? _value.motto
          : motto // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as Radius,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganizationImpl extends _Organization {
  const _$OrganizationImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      this.description,
      this.code,
      @JsonKey(name: 'arrival_time') this.arrivalTime,
      @JsonKey(name: 'departure_time') this.departureTime,
      this.motto,
      this.logo,
      required this.radius,
      required this.location})
      : super._();

  factory _$OrganizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? code;
  @override
  @JsonKey(name: 'arrival_time')
  final String? arrivalTime;
  @override
  @JsonKey(name: 'departure_time')
  final String? departureTime;
  @override
  final String? motto;
  @override
  final String? logo;
  @override
  final Radius radius;
  @override
  final GeoLocation location;

  @override
  String toString() {
    return 'Organization(id: $id, name: $name, description: $description, code: $code, arrivalTime: $arrivalTime, departureTime: $departureTime, motto: $motto, logo: $logo, radius: $radius, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.arrivalTime, arrivalTime) ||
                other.arrivalTime == arrivalTime) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.motto, motto) || other.motto == motto) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, code,
      arrivalTime, departureTime, motto, logo, radius, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationImplCopyWith<_$OrganizationImpl> get copyWith =>
      __$$OrganizationImplCopyWithImpl<_$OrganizationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationImplToJson(
      this,
    );
  }
}

abstract class _Organization extends Organization {
  const factory _Organization(
      {@JsonKey(name: '_id') required final String? id,
      required final String name,
      final String? description,
      final String? code,
      @JsonKey(name: 'arrival_time') final String? arrivalTime,
      @JsonKey(name: 'departure_time') final String? departureTime,
      final String? motto,
      final String? logo,
      required final Radius radius,
      required final GeoLocation location}) = _$OrganizationImpl;
  const _Organization._() : super._();

  factory _Organization.fromJson(Map<String, dynamic> json) =
      _$OrganizationImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get code;
  @override
  @JsonKey(name: 'arrival_time')
  String? get arrivalTime;
  @override
  @JsonKey(name: 'departure_time')
  String? get departureTime;
  @override
  String? get motto;
  @override
  String? get logo;
  @override
  Radius get radius;
  @override
  GeoLocation get location;
  @override
  @JsonKey(ignore: true)
  _$$OrganizationImplCopyWith<_$OrganizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
