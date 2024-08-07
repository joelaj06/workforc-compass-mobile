class WorkForceEndpoints {
  static const String organization = 'organization';
  static const String checkIn = 'attendance_dates';

  static String checkout(String attendanceId) =>
      'attendance_dates/$attendanceId';

  static String attendance(
          {required String userId,
          required String startDate,
          required String endDate}) =>
      'attendance_dates/$userId?start_date=$startDate&end_date=$endDate';

  static String userTask({required String userId, required String? search}) =>
      search != null
          ? 'tasks/user/$userId?search=$search'
          : 'tasks/user/$userId';

  static const String chats = 'chats';
  static const String initiateChat = 'chats/initiate';
  static String message(String chatId) => 'chats/$chatId/message';

  static String messages(String chatId) =>'chats/$chatId/messages';
}
