
import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../models/response/user/user_model.dart';
import '../../../repositories/auth_repository.dart';

class FetchUser implements UseCase<User, String>{
  FetchUser(this.authRepository);

  final AuthRepository authRepository;
  @override
  Future<Either<Failure, User>> call(String userId) {
    return authRepository.fetchUser(userId);
  }

}