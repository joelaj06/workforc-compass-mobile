import 'package:dartz/dartz.dart';
import 'package:work_compass/core/errors/failure.dart';
import 'package:work_compass/core/usecase/usecase.dart';
import 'package:work_compass/features/workforce_compass/data/models/request/attendance/attendance_request.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/attendance/attendance_model.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository.dart';

class UserCheckOut implements UseCase<Attendance, AttendanceRequest>{
  UserCheckOut({required this.workForceRepository});

  final WorkForceRepository workForceRepository;

  @override
  Future<Either<Failure, Attendance>> call(AttendanceRequest request) {
    return workForceRepository.userCheckOut(request);
  }
}