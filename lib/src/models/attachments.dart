import 'package:json_annotation/json_annotation.dart';

part 'attachments.g.dart';

@JsonSerializable()
class Attachments {
  Attachments({this.id, this.url});
  factory Attachments.fromJson(Map<String, dynamic> json) =>
      _$AttachmentsFromJson(json);
  final String? id;
  final String? url;

  Map<String, dynamic> toJson() => _$AttachmentsToJson(this);
}
