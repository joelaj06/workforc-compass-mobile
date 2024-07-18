// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) {
  return _UserRequest.fromJson(json);
}

/// @nodoc
mixin _$UserRequest {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get confirmPassword => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_title')
  String? get jobTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_description')
  String? get jobDescription => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  List<String>? get skills => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_agent')
  bool? get isAgent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRequestCopyWith<UserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestCopyWith<$Res> {
  factory $UserRequestCopyWith(
          UserRequest value, $Res Function(UserRequest) then) =
      _$UserRequestCopyWithImpl<$Res, UserRequest>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? email,
      String? address,
      String? phone,
      String? password,
      String? confirmPassword,
      String? image,
      @JsonKey(name: 'job_title') String? jobTitle,
      @JsonKey(name: 'job_description') String? jobDescription,
      String? company,
      List<String>? skills,
      @JsonKey(name: 'is_agent') bool? isAgent});
}

/// @nodoc
class _$UserRequestCopyWithImpl<$Res, $Val extends UserRequest>
    implements $UserRequestCopyWith<$Res> {
  _$UserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? image = freezed,
    Object? jobTitle = freezed,
    Object? jobDescription = freezed,
    Object? company = freezed,
    Object? skills = freezed,
    Object? isAgent = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
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
      isAgent: freezed == isAgent
          ? _value.isAgent
          : isAgent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRequestCopyWith<$Res>
    implements $UserRequestCopyWith<$Res> {
  factory _$$_UserRequestCopyWith(
          _$_UserRequest value, $Res Function(_$_UserRequest) then) =
      __$$_UserRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? email,
      String? address,
      String? phone,
      String? password,
      String? confirmPassword,
      String? image,
      @JsonKey(name: 'job_title') String? jobTitle,
      @JsonKey(name: 'job_description') String? jobDescription,
      String? company,
      List<String>? skills,
      @JsonKey(name: 'is_agent') bool? isAgent});
}

/// @nodoc
class __$$_UserRequestCopyWithImpl<$Res>
    extends _$UserRequestCopyWithImpl<$Res, _$_UserRequest>
    implements _$$_UserRequestCopyWith<$Res> {
  __$$_UserRequestCopyWithImpl(
      _$_UserRequest _value, $Res Function(_$_UserRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? image = freezed,
    Object? jobTitle = freezed,
    Object? jobDescription = freezed,
    Object? company = freezed,
    Object? skills = freezed,
    Object? isAgent = freezed,
  }) {
    return _then(_$_UserRequest(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
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
      isAgent: freezed == isAgent
          ? _value.isAgent
          : isAgent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRequest extends _UserRequest {
  const _$_UserRequest(
      {this.id,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.email,
      this.address,
      this.phone,
      this.password,
      this.confirmPassword,
      this.image,
      @JsonKey(name: 'job_title') this.jobTitle,
      @JsonKey(name: 'job_description') this.jobDescription,
      this.company,
      final List<String>? skills,
      @JsonKey(name: 'is_agent') this.isAgent})
      : _skills = skills,
        super._();

  factory _$_UserRequest.fromJson(Map<String, dynamic> json) =>
      _$$_UserRequestFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String? password;
  @override
  final String? confirmPassword;
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
  @JsonKey(name: 'is_agent')
  final bool? isAgent;

  @override
  String toString() {
    return 'UserRequest(id: $id, firstName: $firstName, lastName: $lastName, email: $email, address: $address, phone: $phone, password: $password, confirmPassword: $confirmPassword, image: $image, jobTitle: $jobTitle, jobDescription: $jobDescription, company: $company, skills: $skills, isAgent: $isAgent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.jobDescription, jobDescription) ||
                other.jobDescription == jobDescription) &&
            (identical(other.company, company) || other.company == company) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
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
      phone,
      password,
      confirmPassword,
      image,
      jobTitle,
      jobDescription,
      company,
      const DeepCollectionEquality().hash(_skills),
      isAgent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRequestCopyWith<_$_UserRequest> get copyWith =>
      __$$_UserRequestCopyWithImpl<_$_UserRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRequestToJson(
      this,
    );
  }
}

abstract class _UserRequest extends UserRequest {
  const factory _UserRequest(
      {final String? id,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      final String? email,
      final String? address,
      final String? phone,
      final String? password,
      final String? confirmPassword,
      final String? image,
      @JsonKey(name: 'job_title') final String? jobTitle,
      @JsonKey(name: 'job_description') final String? jobDescription,
      final String? company,
      final List<String>? skills,
      @JsonKey(name: 'is_agent') final bool? isAgent}) = _$_UserRequest;
  const _UserRequest._() : super._();

  factory _UserRequest.fromJson(Map<String, dynamic> json) =
      _$_UserRequest.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get phone;
  @override
  String? get password;
  @override
  String? get confirmPassword;
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
  @JsonKey(name: 'is_agent')
  bool? get isAgent;
  @override
  @JsonKey(ignore: true)
  _$$_UserRequestCopyWith<_$_UserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
