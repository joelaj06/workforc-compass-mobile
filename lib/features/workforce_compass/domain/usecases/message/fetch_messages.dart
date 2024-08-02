
import 'package:dartz/dartz.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/listpage/listpage.dart';
import '../../../data/models/response/message/message_model.dart';

class FetchMessages implements UseCase<ListPage<Message>, PageParams>{
  FetchMessages({required this.workForceRepository});

  final WorkForceRepository workForceRepository;

  @override
  Future<Either<Failure, ListPage<Message>>> call(PageParams params) {
    return workForceRepository.fetchMessages(chatId: params.chatId!);
  }

}