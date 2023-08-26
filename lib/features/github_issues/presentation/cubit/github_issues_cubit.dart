import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_issues_flutter_app_test/core/resources/constants.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/data/models/github_issues_response.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/domain/repository/github_issues_repository.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/states/github_isssues_states.dart';

class GitHubIssuesCubit extends Cubit<GitHubIssuesStates> {
  GitHubIssuesCubit({required this.gitHubIssuesRepository})
      : super(GitHubIssuesStateInitial()) {
    getGitHubIssues();
  }

  int page = 1;
  final GithubIssuesRepository gitHubIssuesRepository;

  Future<void> getGitHubIssues() async {
    try {
      if (state is GithubIssuesStateLoading) return;

      final currentState = state;

      List<GitHubIssuesResponse> previousGitHubIssuesList = [];

      if (currentState is GitHubIssuesStateLoaded) {
        previousGitHubIssuesList = currentState.githubIssues;
      }

      emit(GithubIssuesStateLoading(previousGitHubIssuesList,
          isFirstFetch: page == 1));

      final gitHubIssues = (state as GithubIssuesStateLoading).previousIssues;
      gitHubIssues.addAll(
        await gitHubIssuesRepository.getGitHubIssues(
            page: page, perPage: Constants.perPage),
      );
      page++;

      emit(
        GitHubIssuesStateLoaded(gitHubIssues),
      );
    } on DioException catch (e) {
      GitHubIssuesStateError(
        message: e.toString(),
      );
    }
  }
}
