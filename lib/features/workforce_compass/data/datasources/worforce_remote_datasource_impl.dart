import 'package:work_compass/features/workforce_compass/data/datasources/workforce_endpoints.dart';
import 'package:work_compass/features/workforce_compass/data/datasources/workforce_remote_datasource.dart';
import 'package:work_compass/features/workforce_compass/data/models/request/attendance/attendance_request.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/attendance/attendance_model.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/organization/organization_model.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/task/task_model.dart';

import '../../../../core/utils/app_http_client.dart';
import '../models/listpage/listpage.dart';
import '../models/request/chat/chat_request.dart';
import '../models/request/message/message_request.dart';
import '../models/response/chat/chat_model.dart';
import '../models/response/chat/initiate_chat_model.dart';
import '../models/response/message/message_model.dart';

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
    final Map<String, dynamic> json = await _client.put(
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

  @override
  Future<List<Task>> fetchUserTasks({required String userId, required String? search}) async {
    final Map<String, dynamic> json = await _client.get(WorkForceEndpoints.userTask(userId: userId, search: search));
    final List<dynamic> items = json['items'] as List<dynamic>;
    return List<Task>.from(
      items.map<Task>(
            (dynamic json) => Task.fromJson(json as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ListPage<Chat>> fetchUserChats() async {
    final Map<String, dynamic> json = await _client.get(WorkForceEndpoints.chats);
    final List<dynamic> items = json['items'] as List<dynamic>;
    final List<Chat> chats = List<Chat>.from(
      items.map<Chat>(
            (dynamic json) => Chat.fromJson(json as Map<String, dynamic>),
      ),
    );
    return ListPage<Chat>(
      grandTotalCount: int.parse(json['total_count'] as String),
      itemList: chats,
    );
  }

  @override
  Future<InitiateChat> initiateChat({required ChatRequest chatRequest}) async {
    final Map<String, dynamic> json = await _client.post(
      WorkForceEndpoints.initiateChat,
      body: chatRequest.toJson(),
    );
    return InitiateChat.fromJson(json);
  }

  @override
  Future<ListPage<Message>> fetchMessages({required String chatId}) async {
    final Map<String, dynamic> json =
    await _client.get(WorkForceEndpoints.messages(chatId));
    final List<dynamic> items = json['items'] as List<dynamic>;
    final List<Message> messages = List<Message>.from(
      items.map<Message>(
            (dynamic json) => Message.fromJson(json as Map<String, dynamic>),
      ),
    );
    return ListPage<Message>(
      grandTotalCount: int.parse(json['total_count'] as String),
      itemList: messages,
    );
  }

  @override
  Future<Message> sendMessage(
      {required String chatId, required MessageRequest messageRequest}) async {
    final Map<String, dynamic> json = await _client
        .post(WorkForceEndpoints.message(chatId), body: messageRequest.toJson());
    return Message.fromJson(json);
  }
}
