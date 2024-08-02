
import 'package:dartz/dartz.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/request/message/message_request.dart';
import '../../../data/models/response/message/message_model.dart';

class PostMessage implements UseCase<Message, MessageRequest> {
  PostMessage({required this.workForceRepository});

  final WorkForceRepository workForceRepository;

  @override
  Future<Either<Failure, Message>> call(MessageRequest request) {
    return workForceRepository.sendMessage(
      chatId: request.chatId!,
      recipient: request.recipient,
      message: request.message,
      notification : request.notification
    );
  }
}
