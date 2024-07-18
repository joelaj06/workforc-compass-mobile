

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../models/response/generic/message_response.dart';
import '../../repositories/auth_repository.dart';

class Logout implements UseCase<MessageResponse,NoParams>{
  Logout({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, MessageResponse>> call(NoParams params) {
    return authRepository.logout();
  }
}