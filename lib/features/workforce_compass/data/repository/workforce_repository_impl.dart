import 'package:dartz/dartz.dart' hide Task;
import 'package:work_compass/core/errors/failure.dart';
import 'package:work_compass/core/utils/repository.dart';
import 'package:work_compass/features/workforce_compass/data/datasources/workforce_remote_datasource.dart';
import 'package:work_compass/features/workforce_compass/data/models/request/attendance/attendance_request.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/attendance/attendance_model.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/organization/organization_model.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/task/task_model.dart';
import 'package:work_compass/features/workforce_compass/data/repository/workforce_repository.dart';

import '../models/listpage/listpage.dart';
import '../models/request/chat/chat_request.dart';
import '../models/request/message/message_request.dart';
import '../models/request/notification/notification.dart';
import '../models/response/chat/chat_model.dart';
import '../models/response/chat/initiate_chat_model.dart';
import '../models/response/message/message_content_model.dart';
import '../models/response/message/message_model.dart';

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
  Future<Either<Failure, List<Task>>> fetchUserTask(
      {required String userId, required String? search}) {
    return makeRequest(workforceRemoteDatasource.fetchUserTasks(
        userId: userId, search: search));
  }

  @override
  Future<Either<Failure, ListPage<Chat>>> fetchUserChats() {
    return makeRequest(workforceRemoteDatasource.fetchUserChats());
  }

  @override
  Future<Either<Failure, InitiateChat>> initiateChat(
      {required ChatRequest chatRequest}) {
    return makeRequest(
        workforceRemoteDatasource.initiateChat(chatRequest: chatRequest));
  }

  @override
  Future<Either<Failure, ListPage<Message>>> fetchMessages(
      {required String chatId}) {
    return makeRequest(workforceRemoteDatasource.fetchMessages(chatId: chatId));
  }

  @override
  Future<Either<Failure, Message>> sendMessage(
      {required String chatId,
        required String recipient,
        required MessageContent message,
        required FCMNotification? notification,}) {
    return makeRequest(
      workforceRemoteDatasource.sendMessage(
        chatId: chatId,
        messageRequest: MessageRequest(
          recipient: recipient,
          message: message,
          notification: notification,
        ),
      ),
    );
  }

}
