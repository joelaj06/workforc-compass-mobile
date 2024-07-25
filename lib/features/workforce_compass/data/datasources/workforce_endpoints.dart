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
}
