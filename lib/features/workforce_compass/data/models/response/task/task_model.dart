// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:work_compass/features/authentication/data/models/response/user/user_model.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    @JsonKey(name: '_id') required String id,
    required String title,
    String? description,
    User? assignee,
    String? startDate,
    User? reviewer,
    required String? status,
  }) = _Task;

  const Task._();

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);

  factory Task.empty() =>  const Task(
    title: '',
    description: '',
    id: '',
    status: '',
  );
}
