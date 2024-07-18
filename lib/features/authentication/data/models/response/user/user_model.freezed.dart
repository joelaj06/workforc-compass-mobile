// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_title')
  String? get jobTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_description')
  String? get jobDescription => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  List<String>? get skills => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_agent')
  bool get isAgent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String? address,
      String? token,
      String? phone,
      String? image,
      @JsonKey(name: 'job_title') String? jobTitle,
      @JsonKey(name: 'job_description') String? jobDescription,
      String? company,
      List<String>? skills,
      String? createdAt,
      @JsonKey(name: 'is_agent') bool isAgent});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? address = freezed,
    Object? token = freezed,
    Object? phone = freezed,
    Object? image = freezed,
    Object? jobTitle = freezed,
    Object? jobDescription = freezed,
    Object? company = freezed,
    Object? skills = freezed,
    Object? createdAt = freezed,
    Object? isAgent = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      jobTitle: freezed == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      jobDescription: freezed == jobDescription
          ? _value.jobDescription
          : jobDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isAgent: null == isAgent
          ? _value.isAgent
          : isAgent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String? address,
      String? token,
      String? phone,
      String? image,
      @JsonKey(name: 'job_title') String? jobTitle,
      @JsonKey(name: 'job_description') String? jobDescription,
      String? company,
      List<String>? skills,
      String? createdAt,
      @JsonKey(name: 'is_agent') bool isAgent});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? address = freezed,
    Object? token = freezed,
    Object? phone = freezed,
    Object? image = freezed,
    Object? jobTitle = freezed,
    Object? jobDescription = freezed,
    Object? company = freezed,
    Object? skills = freezed,
    Object? createdAt = freezed,
    Object? isAgent = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      jobTitle: freezed == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      jobDescription: freezed == jobDescription
          ? _value.jobDescription
          : jobDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: freezed == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isAgent: null == isAgent
          ? _value.isAgent
          : isAgent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  const _$_User(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.email,
      this.address,
      this.token,
      this.phone,
      this.image,
      @JsonKey(name: 'job_title') this.jobTitle,
      @JsonKey(name: 'job_description') this.jobDescription,
      this.company,
      final List<String>? skills,
      this.createdAt,
      @JsonKey(name: 'is_agent') required this.isAgent})
      : _skills = skills,
        super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String email;
  @override
  final String? address;
  @override
  final String? token;
  @override
  final String? phone;
  @override
  final String? image;
  @override
  @JsonKey(name: 'job_title')
  final String? jobTitle;
  @override
  @JsonKey(name: 'job_description')
  final String? jobDescription;
  @override
  final String? company;
  final List<String>? _skills;
  @override
  List<String>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? createdAt;
  @override
  @JsonKey(name: 'is_agent')
  final bool isAgent;

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, email: $email, address: $address, token: $token, phone: $phone, image: $image, jobTitle: $jobTitle, jobDescription: $jobDescription, company: $company, skills: $skills, createdAt: $createdAt, isAgent: $isAgent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.jobDescription, jobDescription) ||
                other.jobDescription == jobDescription) &&
            (identical(other.company, company) || other.company == company) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isAgent, isAgent) || other.isAgent == isAgent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      email,
      address,
      token,
      phone,
      image,
      jobTitle,
      jobDescription,
      company,
      const DeepCollectionEquality().hash(_skills),
      createdAt,
      isAgent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {@JsonKey(name: '_id') required final String id,
      @JsonKey(name: 'first_name') required final String firstName,
      @JsonKey(name: 'last_name') required final String lastName,
      required final String email,
      final String? address,
      final String? token,
      final String? phone,
      final String? image,
      @JsonKey(name: 'job_title') final String? jobTitle,
      @JsonKey(name: 'job_description') final String? jobDescription,
      final String? company,
      final List<String>? skills,
      final String? createdAt,
      @JsonKey(name: 'is_agent') required final bool isAgent}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get email;
  @override
  String? get address;
  @override
  String? get token;
  @override
  String? get phone;
  @override
  String? get image;
  @override
  @JsonKey(name: 'job_title')
  String? get jobTitle;
  @override
  @JsonKey(name: 'job_description')
  String? get jobDescription;
  @override
  String? get company;
  @override
  List<String>? get skills;
  @override
  String? get createdAt;
  @override
  @JsonKey(name: 'is_agent')
  bool get isAgent;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
