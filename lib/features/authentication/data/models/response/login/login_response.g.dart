// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      id: json['_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      token: json['token'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      jobTitle: json['job_title'] as String?,
      jobDescription: json['job_description'] as String?,
      company: json['company'] as String?,
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'address': instance.address,
      'token': instance.token,
      'phone': instance.phone,
      'image': instance.image,
      'job_title': instance.jobTitle,
      'job_description': instance.jobDescription,
      'company': instance.company,
      'skills': instance.skills,
      'createdAt': instance.createdAt,
    };
