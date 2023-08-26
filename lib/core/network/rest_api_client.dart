import 'package:dio/dio.dart';
import 'package:github_issues_flutter_app_test/core/network/end_points.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/data/models/github_issues_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi()
abstract class RestAPIClient {
  factory RestAPIClient(Dio dio, {String baseUrl}) = _RestAPIClient;

  @GET(Endpoints.gitHubIssues)
  Future<List<GitHubIssuesResponse>> getGitHubIssues({
    @Query('page') required int page,
    @Query('per_page') required int perPage,
  });
}
