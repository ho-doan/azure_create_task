import 'package:json_annotation/json_annotation.dart';

part 'sub_task_create.g.dart';

@JsonSerializable()
class SubTaskCreate {
  final String? op;
  final String? path;
  final String? from;
  final String? value;

  SubTaskCreate({this.op, this.path, this.from, this.value});

  factory SubTaskCreate.fromJson(Map<String, dynamic> json) =>
      _$SubTaskCreateFromJson(json);

  Map<String, dynamic> toJson() => _$SubTaskCreateToJson(this);
}
