// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubTaskCreate _$SubTaskCreateFromJson(Map<String, dynamic> json) =>
    SubTaskCreate(
      op: json['op'] as String?,
      path: json['path'] as String?,
      from: json['from'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$SubTaskCreateToJson(SubTaskCreate instance) =>
    <String, dynamic>{
      'op': instance.op,
      'path': instance.path,
      'from': instance.from,
      'value': instance.value,
    };
