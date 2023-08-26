import 'package:github_issues_flutter_app_test/features/github_issues/data/models/github_issues_response.dart';

abstract class GithubIssuesRepository {
  Future<List<GitHubIssuesResponse>> getGitHubIssues(
      {required int page, required int perPage});
}
