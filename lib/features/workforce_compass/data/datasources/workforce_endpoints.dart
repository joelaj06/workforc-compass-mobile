class WorkForceEndpoints {
  static const String organization = 'organization';
  static const String checkIn = 'attendance_dates';
  static  String checkout(String attendanceId) =>
      'attendance_dates/$attendanceId';

}