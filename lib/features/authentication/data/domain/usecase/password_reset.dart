import 'package:dartz/dartz.dart';
import 'package:work_compass/core/errors/failure.dart';
import 'package:work_compass/core/usecase/usecase.dart';
import 'package:work_compass/features/authentication/data/models/response/generic/message_response.dart';
import 'package:work_compass/features/authentication/data/repositories/auth_repository.dart';
import '../../models/request/password_reset/password_reset_request.dart';

class ResetPassword implements UseCase<MessageResponse, PasswordResetRequest>{
  ResetPassword({required this.authRepository});
  final AuthRepository authRepository;
  @override
  Future<Either<Failure, MessageResponse>> call(PasswordResetRequest request) {
    return authRepository.passwordReset(resetRequest: request);
  }

}