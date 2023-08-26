import 'package:github_issues_flutter_app_test/features/github_issues/data/models/github_issues_response.dart';

abstract class GitHubIssuesStates {}

class GitHubIssuesStateInitial extends GitHubIssuesStates {}

class GitHubIssuesStateError extends GitHubIssuesStates {
  final String message;

  GitHubIssuesStateError({required this.message});
}

class GitHubIssuesStateLoaded extends GitHubIssuesStates {
  final List<GitHubIssuesResponse> githubIssues;

  GitHubIssuesStateLoaded(this.githubIssues);
}

class GithubIssuesStateLoading extends GitHubIssuesStates {
  final List<GitHubIssuesResponse> previousIssues;
  final bool isFirstFetch;

  GithubIssuesStateLoading(this.previousIssues, {this.isFirstFetch = false});
}
