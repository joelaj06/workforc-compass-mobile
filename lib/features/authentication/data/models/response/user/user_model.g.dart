// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
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
      isAgent: json['is_agent'] as bool,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
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
      'is_agent': instance.isAgent,
    };
