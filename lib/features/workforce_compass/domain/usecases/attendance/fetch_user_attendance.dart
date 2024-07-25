import 'package:dartz/dartz.dart';
import 'package:work_compass/core/errors/failure.dart';
import 'package:work_compass/core/usecase/usecase.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/attendance/attendance_model.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository.dart';

class FetchUserAttendance implements UseCase<List<Attendance>, PageParams> {
  FetchUserAttendance({required this.workForceRepository});

  final WorkForceRepository workForceRepository;

  @override
  Future<Either<Failure, List<Attendance>>> call(PageParams params) {
    return workForceRepository.fetchUserAttendance(userId: params.userId!,
        startDate: params.startDate!,
        endDate: params.endDate!);
  }

}