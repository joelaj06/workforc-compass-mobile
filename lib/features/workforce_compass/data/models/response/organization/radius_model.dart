// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'radius_model.freezed.dart';
part 'radius_model.g.dart';

@freezed
class Radius with _$Radius {
  const factory Radius({
   required int radius,
    required String label,
  }) = _Radius;

  const Radius._();

  factory Radius.fromJson(Map<String, dynamic> json) =>
      _$RadiusFromJson(json);

  factory Radius.empty() =>  const Radius(
   radius: 0,
    label: ''
  );
}
