
import 'package:dartz/dartz.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/request/chat/chat_request.dart';
import '../../../data/models/response/chat/initiate_chat_model.dart';

class InitiateNewChat implements UseCase<InitiateChat,ChatRequest>{
  InitiateNewChat({required this.workForceRepository});

  final WorkForceRepository workForceRepository;
  @override
  Future<Either<Failure, InitiateChat>> call(ChatRequest request) {
    return workForceRepository.initiateChat(chatRequest: request);
  }

}