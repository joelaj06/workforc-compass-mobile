import 'package:work_compass/features/workforce_compass/data/models/request/attendance/attendance_request.dart';

import '../models/response/attendance/attendance_model.dart';
import '../models/response/organization/organization_model.dart';

abstract class WorkforceRemoteDatasource {
  Future<Organization> fetchOrganization();

  Future<Attendance> userCheckIn(AttendanceRequest attendanceRequest);

  Future<Attendance> userCheckOut(AttendanceRequest attendanceRequest);

  Future<List<Attendance>> fetchUserAttendance(
      {required String userId,
      required String startDate,
      required String endDate});
}
