

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/request/login/login_request.dart';
import '../models/request/password_reset/password_reset_request.dart';
import '../models/request/user/user_request.dart';
import '../models/response/generic/message_response.dart';
import '../models/response/user/user_model.dart';



abstract class AuthRepository {
  Future<Either<Failure, User>> login(LoginRequest request);
  Future<Either<Failure, User>> loadUser();
  Future<Either<Failure, User>> fetchUser(String userId);
  Future<Either<Failure, User>> updateUser({
    required String id,
    String? firstName,
    String? lastName,
    String? email,
    String? address,
    String? phone,
    String? image,
     String? jobTitle,
     String? jobDescription,
    String? company,
    List<String>? skills,
    bool? isAgent,
});

  Future<Either<Failure,MessageResponse>> logout();
  Future<Either<Failure,User>> addUser({required UserRequest userRequest});

  Future<Either<Failure,MessageResponse>> passwordReset(
      {required PasswordResetRequest resetRequest});

}
