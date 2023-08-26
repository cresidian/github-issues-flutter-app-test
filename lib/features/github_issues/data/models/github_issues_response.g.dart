// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_issues_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitHubIssuesResponse _$GitHubIssuesResponseFromJson(
        Map<String, dynamic> json) =>
    GitHubIssuesResponse(
      url: json['url'] as String?,
      repositoryUrl: json['repository_url'] as String?,
      labelsUrl: json['labels_url'] as String?,
      commentsUrl: json['comments_url'] as String?,
      eventsUrl: json['events_url'] as String?,
      htmlUrl: json['html_url'] as String?,
      id: json['id'] as int?,
      nodeId: json['node_id'] as String?,
      number: json['number'] as int?,
      title: json['title'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => Labels.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] as String?,
      locked: json['locked'] as bool?,
      assignees: json['assignees'] as List<dynamic>?,
      milestone: json['milestone'] as String?,
      comments: json['comments'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      closedAt: json['closed_at'] as String?,
      authorAssociation: json['author_association'] as String?,
      activeLockReason: json['active_lock_reason'] as String?,
      draft: json['draft'] as bool?,
      pullRequest: json['pull_request'] == null
          ? null
          : PullRequest.fromJson(json['pull_request'] as Map<String, dynamic>),
      body: json['body'] as String?,
      reactions: json['reactions'] == null
          ? null
          : Reactions.fromJson(json['reactions'] as Map<String, dynamic>),
      timelineUrl: json['timeline_url'] as String?,
      performedViaGithubApp: json['performed_via_github_app'] as String?,
      stateReason: json['state_reason'] as String?,
    );

User _$UserFromJson(Map<String, dynamic> json) => User(
      login: json['login'] as String?,
      id: json['id'] as int?,
      nodeId: json['node_id'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      gravatarId: json['gravatar_id'] as String?,
      url: json['url'] as String?,
      htmlUrl: json['html_url'] as String?,
      followersUrl: json['followers_url'] as String?,
      followingUrl: json['following_url'] as String?,
      gistsUrl: json['gists_url'] as String?,
      starredUrl: json['starred_url'] as String?,
      subscriptionsUrl: json['subscriptions_url'] as String?,
      organizationsUrl: json['organizations_url'] as String?,
      reposUrl: json['repos_url'] as String?,
      eventsUrl: json['events_url'] as String?,
      receivedEventsUrl: json['received_events_url'] as String?,
      type: json['type'] as String?,
      siteAdmin: json['site_admin'] as bool?,
    );

Labels _$LabelsFromJson(Map<String, dynamic> json) => Labels(
      id: json['id'] as int?,
      nodeId: json['node_id'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      color: json['color'] as String?,
      defaultLabel: json['default'] as bool?,
      description: json['description'] as String?,
    );

PullRequest _$PullRequestFromJson(Map<String, dynamic> json) => PullRequest(
      url: json['url'] as String?,
      htmlUrl: json['html_url'] as String?,
      diffUrl: json['diff_url'] as String?,
      patchUrl: json['patch_url'] as String?,
      mergedAt: json['merged_at'] as String?,
    );

Reactions _$ReactionsFromJson(Map<String, dynamic> json) => Reactions(
      url: json['url'] as String?,
      totalCount: json['total_count'] as int?,
      addition: json['+1'] as int?,
      subtraction: json['-1'] as int?,
      laugh: json['laugh'] as int?,
      hooray: json['hooray'] as int?,
      confused: json['confused'] as int?,
      heart: json['heart'] as int?,
      rocket: json['rocket'] as int?,
      eyes: json['eyes'] as int?,
    );
