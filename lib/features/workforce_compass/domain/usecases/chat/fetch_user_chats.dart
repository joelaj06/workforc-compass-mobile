
import 'package:dartz/dartz.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/listpage/listpage.dart';
import '../../../data/models/response/chat/chat_model.dart';

class FetchUserChats implements UseCase<ListPage<Chat>, NoParams>{
  FetchUserChats({required this.workForceRepository});

  final WorkForceRepository workForceRepository;

  @override
  Future<Either<Failure, ListPage<Chat>>> call(NoParams params) {
    return workForceRepository.fetchUserChats();
  }

}