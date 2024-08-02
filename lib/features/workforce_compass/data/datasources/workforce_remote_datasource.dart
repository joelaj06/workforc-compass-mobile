import 'package:work_compass/features/workforce_compass/data/models/request/attendance/attendance_request.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/task/task_model.dart';

import '../models/listpage/listpage.dart';
import '../models/request/chat/chat_request.dart';
import '../models/request/message/message_request.dart';
import '../models/response/attendance/attendance_model.dart';
import '../models/response/chat/chat_model.dart';
import '../models/response/chat/initiate_chat_model.dart';
import '../models/response/message/message_model.dart';
import '../models/response/organization/organization_model.dart';

abstract class WorkforceRemoteDatasource {
  Future<Organization> fetchOrganization();

  Future<Attendance> userCheckIn(AttendanceRequest attendanceRequest);

  Future<Attendance> userCheckOut(AttendanceRequest attendanceRequest);

  Future<List<Attendance>> fetchUserAttendance(
      {required String userId,
      required String startDate,
      required String endDate});

  Future<List<Task>> fetchUserTasks({required String userId, required String? search});

  Future<ListPage<Chat>> fetchUserChats();

  Future<InitiateChat> initiateChat({required ChatRequest chatRequest});

  Future<ListPage<Message>> fetchMessages({required String chatId});

  Future<Message> sendMessage(
      {required String chatId, required MessageRequest messageRequest});
}
