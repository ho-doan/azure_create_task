import 'package:json_annotation/json_annotation.dart';

part 'sub_task_create.g.dart';

@JsonSerializable()
class SubTaskCreate {
  SubTaskCreate({this.op, this.path, this.from, this.value});
  factory SubTaskCreate.fromJson(Map<String, dynamic> json) =>
      _$SubTaskCreateFromJson(json);
  final String? op;
  final String? path;
  final String? from;
  final String? value;

  Map<String, dynamic> toJson() => _$SubTaskCreateToJson(this);
}
