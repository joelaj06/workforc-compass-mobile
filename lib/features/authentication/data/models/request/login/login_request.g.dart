// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginRequest _$$_LoginRequestFromJson(Map<String, dynamic> json) =>
    _$_LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      deviceToken: json['device_token'] as String?,
    );

Map<String, dynamic> _$$_LoginRequestToJson(_$_LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'device_token': instance.deviceToken,
    };
