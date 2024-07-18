// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRequest _$$_UserRequestFromJson(Map<String, dynamic> json) =>
    _$_UserRequest(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      image: json['image'] as String?,
      jobTitle: json['job_title'] as String?,
      jobDescription: json['job_description'] as String?,
      company: json['company'] as String?,
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isAgent: json['is_agent'] as bool?,
    );

Map<String, dynamic> _$$_UserRequestToJson(_$_UserRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'image': instance.image,
      'job_title': instance.jobTitle,
      'job_description': instance.jobDescription,
      'company': instance.company,
      'skills': instance.skills,
      'is_agent': instance.isAgent,
    };
