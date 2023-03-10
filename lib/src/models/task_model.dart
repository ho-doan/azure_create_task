import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'rev')
  final int? rev;
  @JsonKey(name: 'fields')
  final Avatar? fields;
  @JsonKey(name: '_links')
  final Links? lLinks;
  @JsonKey(name: 'url')
  final String? url;

  TaskModel({this.id, this.rev, this.fields, this.lLinks, this.url});

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}

@JsonSerializable()
class Fields {
  @JsonKey(name: 'System.AreaPath')
  final String? systemAreaPath;
  @JsonKey(name: 'System.TeamProject')
  final String? systemTeamProject;
  @JsonKey(name: 'System.IterationPath')
  final String? systemIterationPath;
  @JsonKey(name: 'System.WorkItemType')
  final String? systemWorkItemType;
  @JsonKey(name: 'System.State')
  final String? systemState;
  @JsonKey(name: 'System.Reason')
  final String? systemReason;
  @JsonKey(name: 'System.AssignedTo')
  final SystemAssignedTo? systemAssignedTo;
  @JsonKey(name: 'System.CreatedDate')
  final String? systemCreatedDate;
  @JsonKey(name: 'System.CreatedBy')
  final SystemAssignedTo? systemCreatedBy;
  @JsonKey(name: 'System.ChangedDate')
  final String? systemChangedDate;
  @JsonKey(name: 'System.ChangedBy')
  final SystemAssignedTo? systemChangedBy;
  @JsonKey(name: 'System.CommentCount')
  final int? systemCommentCount;
  @JsonKey(name: 'System.Title')
  final String? systemTitle;
  @JsonKey(name: 'Microsoft.VSTS.Common.StateChangeDate')
  final String? microsoftVSTSCommonStateChangeDate;
  @JsonKey(name: 'System.Description')
  final String? systemDescription;
  @JsonKey(name: 'Microsoft.VSTS.TCM.ReproSteps')
  final String? microsoftVSTSTCMReproSteps;

  Fields({
    this.systemAreaPath,
    this.systemTeamProject,
    this.systemIterationPath,
    this.systemWorkItemType,
    this.systemState,
    this.systemReason,
    this.systemAssignedTo,
    this.systemCreatedDate,
    this.systemCreatedBy,
    this.systemChangedDate,
    this.systemChangedBy,
    this.systemCommentCount,
    this.systemTitle,
    this.microsoftVSTSCommonStateChangeDate,
    this.systemDescription,
    this.microsoftVSTSTCMReproSteps,
  });
  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);

  Map<String, dynamic> toJson() => _$FieldsToJson(this);
}

@JsonSerializable()
class SystemAssignedTo {
  @JsonKey(name: 'displayName')
  final String? displayName;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: '_links')
  final LinksAvatar? lLinks;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'uniqueName')
  final String? uniqueName;
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @JsonKey(name: 'descriptor')
  final String? descriptor;

  SystemAssignedTo({
    this.displayName,
    this.url,
    this.lLinks,
    this.id,
    this.uniqueName,
    this.imageUrl,
    this.descriptor,
  });
  factory SystemAssignedTo.fromJson(Map<String, dynamic> json) =>
      _$SystemAssignedToFromJson(json);

  Map<String, dynamic> toJson() => _$SystemAssignedToToJson(this);
}

@JsonSerializable()
class LinksAvatar {
  final Avatar? avatar;

  LinksAvatar({this.avatar});
  factory LinksAvatar.fromJson(Map<String, dynamic> json) =>
      _$LinksAvatarFromJson(json);

  Map<String, dynamic> toJson() => _$LinksAvatarToJson(this);
}

@JsonSerializable()
class Avatar {
  final String? href;

  Avatar({this.href});
  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}

@JsonSerializable()
class Links {
  final Avatar? self;
  final Avatar? workItemUpdates;
  final Avatar? workItemRevisions;
  final Avatar? workItemComments;
  final Avatar? html;
  final Avatar? workItemType;
  final Avatar? fields;

  Links({
    this.self,
    this.workItemUpdates,
    this.workItemRevisions,
    this.workItemComments,
    this.html,
    this.workItemType,
    this.fields,
  });
  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
