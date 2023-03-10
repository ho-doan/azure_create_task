import 'package:json_annotation/json_annotation.dart';

part 'attachments.g.dart';

@JsonSerializable()
class Attachments {
  final String? id;
  final String? url;

  Attachments({this.id, this.url});
  factory Attachments.fromJson(Map<String, dynamic> json) =>
      _$AttachmentsFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentsToJson(this);
}
