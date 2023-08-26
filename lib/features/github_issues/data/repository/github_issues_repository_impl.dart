import 'package:github_issues_flutter_app_test/core/network/rest_api_client.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/data/models/github_issues_response.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/domain/repository/github_issues_repository.dart';

class GitHubIssuesRepositoryImpl extends GithubIssuesRepository {
  GitHubIssuesRepositoryImpl({
    required this.restAPIClient,
  });
  final RestAPIClient restAPIClient;

  @override
  Future<List<GitHubIssuesResponse>> getGitHubIssues(
      {required int page, required int perPage}) async {
    return await restAPIClient.getGitHubIssues(page: page, perPage: perPage);
  }
}
