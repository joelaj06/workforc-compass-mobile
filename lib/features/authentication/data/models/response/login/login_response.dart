// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';

part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String? lastName,
    required String? email,
    String? address,
    String? token,
    String? phone,
    String? image,
    @JsonKey(name: 'job_title') String? jobTitle,
    @JsonKey(name: 'job_description') String? jobDescription,
    String? company,
    List<String>? skills,
    String? createdAt,
  }) = _LoginResponse;

  const LoginResponse._();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  factory LoginResponse.empty() => const LoginResponse(
        id: '',
        firstName: '',
        lastName: '',
        email: '',
      );
}
