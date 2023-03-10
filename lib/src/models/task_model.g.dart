// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as int?,
      rev: json['rev'] as int?,
      fields: json['fields'] == null
          ? null
          : Avatar.fromJson(json['fields'] as Map<String, dynamic>),
      lLinks: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'rev': instance.rev,
      'fields': instance.fields,
      '_links': instance.lLinks,
      'url': instance.url,
    };

Fields _$FieldsFromJson(Map<String, dynamic> json) => Fields(
      systemAreaPath: json['System.AreaPath'] as String?,
      systemTeamProject: json['System.TeamProject'] as String?,
      systemIterationPath: json['System.IterationPath'] as String?,
      systemWorkItemType: json['System.WorkItemType'] as String?,
      systemState: json['System.State'] as String?,
      systemReason: json['System.Reason'] as String?,
      systemAssignedTo: json['System.AssignedTo'] == null
          ? null
          : SystemAssignedTo.fromJson(
              json['System.AssignedTo'] as Map<String, dynamic>),
      systemCreatedDate: json['System.CreatedDate'] as String?,
      systemCreatedBy: json['System.CreatedBy'] == null
          ? null
          : SystemAssignedTo.fromJson(
              json['System.CreatedBy'] as Map<String, dynamic>),
      systemChangedDate: json['System.ChangedDate'] as String?,
      systemChangedBy: json['System.ChangedBy'] == null
          ? null
          : SystemAssignedTo.fromJson(
              json['System.ChangedBy'] as Map<String, dynamic>),
      systemCommentCount: json['System.CommentCount'] as int?,
      systemTitle: json['System.Title'] as String?,
      microsoftVSTSCommonStateChangeDate:
          json['Microsoft.VSTS.Common.StateChangeDate'] as String?,
      systemDescription: json['System.Description'] as String?,
      microsoftVSTSTCMReproSteps:
          json['Microsoft.VSTS.TCM.ReproSteps'] as String?,
    );

Map<String, dynamic> _$FieldsToJson(Fields instance) => <String, dynamic>{
      'System.AreaPath': instance.systemAreaPath,
      'System.TeamProject': instance.systemTeamProject,
      'System.IterationPath': instance.systemIterationPath,
      'System.WorkItemType': instance.systemWorkItemType,
      'System.State': instance.systemState,
      'System.Reason': instance.systemReason,
      'System.AssignedTo': instance.systemAssignedTo,
      'System.CreatedDate': instance.systemCreatedDate,
      'System.CreatedBy': instance.systemCreatedBy,
      'System.ChangedDate': instance.systemChangedDate,
      'System.ChangedBy': instance.systemChangedBy,
      'System.CommentCount': instance.systemCommentCount,
      'System.Title': instance.systemTitle,
      'Microsoft.VSTS.Common.StateChangeDate':
          instance.microsoftVSTSCommonStateChangeDate,
      'System.Description': instance.systemDescription,
      'Microsoft.VSTS.TCM.ReproSteps': instance.microsoftVSTSTCMReproSteps,
    };

SystemAssignedTo _$SystemAssignedToFromJson(Map<String, dynamic> json) =>
    SystemAssignedTo(
      displayName: json['displayName'] as String?,
      url: json['url'] as String?,
      lLinks: json['_links'] == null
          ? null
          : LinksAvatar.fromJson(json['_links'] as Map<String, dynamic>),
      id: json['id'] as String?,
      uniqueName: json['uniqueName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      descriptor: json['descriptor'] as String?,
    );

Map<String, dynamic> _$SystemAssignedToToJson(SystemAssignedTo instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'url': instance.url,
      '_links': instance.lLinks,
      'id': instance.id,
      'uniqueName': instance.uniqueName,
      'imageUrl': instance.imageUrl,
      'descriptor': instance.descriptor,
    };

LinksAvatar _$LinksAvatarFromJson(Map<String, dynamic> json) => LinksAvatar(
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinksAvatarToJson(LinksAvatar instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      href: json['href'] as String?,
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'href': instance.href,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      self: json['self'] == null
          ? null
          : Avatar.fromJson(json['self'] as Map<String, dynamic>),
      workItemUpdates: json['workItemUpdates'] == null
          ? null
          : Avatar.fromJson(json['workItemUpdates'] as Map<String, dynamic>),
      workItemRevisions: json['workItemRevisions'] == null
          ? null
          : Avatar.fromJson(json['workItemRevisions'] as Map<String, dynamic>),
      workItemComments: json['workItemComments'] == null
          ? null
          : Avatar.fromJson(json['workItemComments'] as Map<String, dynamic>),
      html: json['html'] == null
          ? null
          : Avatar.fromJson(json['html'] as Map<String, dynamic>),
      workItemType: json['workItemType'] == null
          ? null
          : Avatar.fromJson(json['workItemType'] as Map<String, dynamic>),
      fields: json['fields'] == null
          ? null
          : Avatar.fromJson(json['fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
      'workItemUpdates': instance.workItemUpdates,
      'workItemRevisions': instance.workItemRevisions,
      'workItemComments': instance.workItemComments,
      'html': instance.html,
      'workItemType': instance.workItemType,
      'fields': instance.fields,
    };
