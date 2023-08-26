import 'package:json_annotation/json_annotation.dart';

part 'github_issues_response.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GitHubIssuesResponse {
  GitHubIssuesResponse({
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.user,
    this.labels,
    this.state,
    this.locked,
    this.assignees,
    this.milestone,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.authorAssociation,
    this.activeLockReason,
    this.draft,
    this.pullRequest,
    this.body,
    this.reactions,
    this.timelineUrl,
    this.performedViaGithubApp,
    this.stateReason,
  });
  final String? url;
  final String? repositoryUrl;
  final String? labelsUrl;
  final String? commentsUrl;
  final String? eventsUrl;
  final String? htmlUrl;
  final int? id;
  final String? nodeId;
  final int? number;
  final String? title;
  final User? user;
  final List<Labels>? labels;
  final String? state;
  final bool? locked;
  final List<dynamic>? assignees;
  final String? milestone;
  final int? comments;
  final String? createdAt;
  final String? updatedAt;
  final String? closedAt;
  final String? authorAssociation;
  final String? activeLockReason;
  final bool? draft;
  final PullRequest? pullRequest;
  final String? body;
  final Reactions? reactions;
  final String? timelineUrl;
  final String? performedViaGithubApp;
  final String? stateReason;

  factory GitHubIssuesResponse.fromJson(Map<String, dynamic> json) =>
      _$GitHubIssuesResponseFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class User {
  User({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });
  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Labels {
  Labels({
    this.id,
    this.nodeId,
    this.url,
    this.name,
    this.color,
    this.defaultLabel,
    this.description,
  });
  final int? id;
  final String? nodeId;
  final String? url;
  final String? name;
  final String? color;
  @JsonKey(name: 'default')
  final bool? defaultLabel;

  factory Labels.fromJson(Map<String, dynamic> json) => _$LabelsFromJson(json);

  final String? description;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class PullRequest {
  PullRequest({
    this.url,
    this.htmlUrl,
    this.diffUrl,
    this.patchUrl,
    this.mergedAt,
  });
  final String? url;
  final String? htmlUrl;
  final String? diffUrl;
  final String? patchUrl;
  final String? mergedAt;

  factory PullRequest.fromJson(Map<String, dynamic> json) =>
      _$PullRequestFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Reactions {
  Reactions({
    this.url,
    this.totalCount,
    this.addition,
    this.subtraction,
    this.laugh,
    this.hooray,
    this.confused,
    this.heart,
    this.rocket,
    this.eyes,
  });
  final String? url;
  final int? totalCount;
  @JsonKey(name: '+1')
  final int? addition;
  @JsonKey(name: '-1')
  final int? subtraction;
  final int? laugh;
  final int? hooray;
  final int? confused;
  final int? heart;
  final int? rocket;
  final int? eyes;

  factory Reactions.fromJson(Map<String, dynamic> json) =>
      _$ReactionsFromJson(json);
}
