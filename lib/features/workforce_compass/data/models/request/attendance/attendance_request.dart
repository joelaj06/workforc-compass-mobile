// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_request.freezed.dart';
part 'attendance_request.g.dart';

@freezed
class AttendanceRequest with _$AttendanceRequest {
  const factory AttendanceRequest({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkout,
    String? location,
    bool? isCheckedIn,
    required String taskId,
    String? completed,
    String? createdAt,
  }) = _AttendanceRequest;

  const AttendanceRequest._();

  factory AttendanceRequest.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRequestFromJson(json);


}
