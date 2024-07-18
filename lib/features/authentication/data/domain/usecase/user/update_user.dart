

import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../models/request/user/user_request.dart';
import '../../../models/response/user/user_model.dart';
import '../../../repositories/auth_repository.dart';

class UpdateUser implements UseCase<User, UserRequest>{
  UpdateUser(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, User>> call(UserRequest request) {
    return authRepository.updateUser(id: request.id!,
      isAgent: request.isAgent,
      skills: request.skills,
      company: request.company,
      jobTitle: request.jobTitle,
      jobDescription: request.jobDescription,
      image: request.image,
      phone: request.phone,
      address: request.address,
      email: request.email,
      lastName: request.lastName,
      firstName: request.firstName,
    );
  }
}