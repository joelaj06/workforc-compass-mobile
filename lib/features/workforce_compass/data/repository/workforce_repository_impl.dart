import 'package:dartz/dartz.dart' hide Task;
import 'package:work_compass/core/errors/failure.dart';
import 'package:work_compass/core/utils/repository.dart';
import 'package:work_compass/features/workforce_compass/data/datasources/workforce_remote_datasource.dart';
import 'package:work_compass/features/workforce_compass/data/models/request/attendance/attendance_request.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/attendance/attendance_model.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/organization/organization_model.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/task/task_model.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository.dart';

class WorkforceRepositoryImpl extends Repository
    implements WorkForceRepository {
  WorkforceRepositoryImpl({required this.workforceRemoteDatasource});

  final WorkforceRemoteDatasource workforceRemoteDatasource;

  @override
  Future<Either<Failure, Organization>> fetchOrganization() {
    return makeRequest(workforceRemoteDatasource.fetchOrganization());
  }

  @override
  Future<Either<Failure, Attendance>> userCheckIn(
      AttendanceRequest attendanceRequest) {
    return makeRequest(
        workforceRemoteDatasource.userCheckIn(attendanceRequest));
  }

  @override
  Future<Either<Failure, Attendance>> userCheckOut(
      AttendanceRequest attendanceRequest) {
    return makeRequest(
        workforceRemoteDatasource.userCheckOut(attendanceRequest));
  }

  @override
  Future<Either<Failure, List<Attendance>>> fetchUserAttendance(
      {required String userId,
      required String startDate,
      required String endDate}) {
    return makeRequest(workforceRemoteDatasource.fetchUserAttendance(
        userId: userId, startDate: startDate, endDate: endDate));
  }

  @override
  Future<Either<Failure, List<Task>>> fetchUserTask({required String userId, required String? search}) {
    return makeRequest(workforceRemoteDatasource.fetchUserTasks(userId: userId, search: search));
  }
}
