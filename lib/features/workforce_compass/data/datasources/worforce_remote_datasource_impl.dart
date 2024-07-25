import 'package:work_compass/features/workforce_compass/data/datasources/workforce_endpoints.dart';
import 'package:work_compass/features/workforce_compass/data/datasources/workforce_remote_datasource.dart';
import 'package:work_compass/features/workforce_compass/data/models/request/attendance/attendance_request.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/attendance/attendance_model.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/organization/organization_model.dart';

import '../../../../core/utils/app_http_client.dart';

class WorkforceRemoteDatasourceImpl implements WorkforceRemoteDatasource {
  WorkforceRemoteDatasourceImpl({required AppHTTPClient client})
      : _client = client;

  final AppHTTPClient _client;

  @override
  Future<Organization> fetchOrganization() async {
    final Map<String, dynamic> json =
        await _client.get(WorkForceEndpoints.organization);
    return Organization.fromJson(json);
  }

  @override
  Future<Attendance> userCheckIn(AttendanceRequest attendanceRequest) async {
    final Map<String, dynamic> json = await _client
        .post(WorkForceEndpoints.checkIn, body: attendanceRequest.toJson());
    return Attendance.fromJson(json);
  }

  @override
  Future<Attendance> userCheckOut(AttendanceRequest attendanceRequest) async {
    final Map<String, dynamic> json = await _client.post(
        WorkForceEndpoints.checkout(attendanceRequest.id!),
        body: attendanceRequest.toJson());
    return Attendance.fromJson(json);
  }

  @override
  Future<List<Attendance>> fetchUserAttendance(
      {required String userId,
      required String startDate,
      required String endDate}) async {
    final Map<String, dynamic> json = await _client.get(
        WorkForceEndpoints.attendance(
            userId: userId, startDate: startDate, endDate: endDate));
    final List<dynamic> items = json['items'] as List<dynamic>;
    return List<Attendance>.from(
      items.map<Attendance>(
        (dynamic json) => Attendance.fromJson(json as Map<String, dynamic>),
      ),
    );
  }
}
