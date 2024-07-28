import 'package:dartz/dartz.dart' hide Task;
import 'package:work_compass/core/errors/failure.dart';
import 'package:work_compass/core/usecase/usecase.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/task/task_model.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository.dart';

class FetchUserTask implements UseCase<List<Task>, PageParams>{
  FetchUserTask({required this.workForceRepository});

  final WorkForceRepository workForceRepository;
  @override
  Future<Either<Failure, List<Task>>> call(PageParams params) {
   return workForceRepository.fetchUserTask(userId: params.userId!,
   search: params.search);
  }

}