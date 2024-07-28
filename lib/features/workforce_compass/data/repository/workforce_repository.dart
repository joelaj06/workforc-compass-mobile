import 'package:dartz/dartz.dart' hide Task;
import 'package:work_compass/core/errors/errors.dart';
import 'package:work_compass/features/workforce_compass/data/models/request/attendance/attendance_request.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/attendance/attendance_model.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/organization/organization_model.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/task/task_model.dart';

abstract class WorkForceRepository {
  Future<Either<Failure, Organization>> fetchOrganization();

  Future<Either<Failure, Attendance>> userCheckIn(
      AttendanceRequest attendanceRequest);

  Future<Either<Failure, Attendance>> userCheckOut(
      AttendanceRequest attendanceRequest);

  Future<Either<Failure, List<Attendance>>> fetchUserAttendance({
    required String userId,
    required String startDate,
    required String endDate,
  });

  Future<Either<Failure, List<Task>>> fetchUserTask({required String userId, required String? search});
}
