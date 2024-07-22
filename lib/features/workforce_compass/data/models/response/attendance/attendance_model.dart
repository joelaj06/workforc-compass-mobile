// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    @JsonKey(name: '_id')required String id,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkout,
    String? location,
    String? completed,
    String? createdAt,
  }) = _Attendance;

  const Attendance._();

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  factory Attendance.empty() =>  const Attendance(
    id: ''
  );
}
