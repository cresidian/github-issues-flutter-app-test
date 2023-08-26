import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_issues_flutter_app_test/core/extensions/build_context.dart';
import 'package:github_issues_flutter_app_test/core/resources/resources.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/data/models/github_issues_response.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/cubit/github_issues_cubit.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/states/github_isssues_states.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/widgets/github_issues_error_widget.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/widgets/github_issuess_success_widget.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/widgets/progress_indicator.dart';

class GitHubIssuesScreen extends StatefulWidget {
  const GitHubIssuesScreen({super.key});

  @override
  State<GitHubIssuesScreen> createState() => _GitHubIssuesScreenState();
}

class _GitHubIssuesScreenState extends State<GitHubIssuesScreen> {
  List<GitHubIssuesResponse> gitHubIssuesList = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.issues,
          style: context.textTheme.headlineMedium
              ?.copyWith(color: AppColors.headlineTextColor),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GitHubIssuesCubit, GitHubIssuesStates>(
          builder: (context, state) {
        if (state is GithubIssuesStateLoading && state.isFirstFetch == true) {
          return const GitHubIssuesScreenLoadingWidget();
        }
        if (state is GithubIssuesStateLoading) {
          gitHubIssuesList = state.previousIssues;
          isLoading = !isLoading;
        } else if (state is GitHubIssuesStateError) {
          return GitHubIssuesErrorWidget(
            errorText: state.message,
            onRetry: () => context.read<GitHubIssuesCubit>().getGitHubIssues(),
          );
        } else if (state is GitHubIssuesStateLoaded) {
          gitHubIssuesList = state.githubIssues;
        }
        return GitHubIssueSuccessWidget(
          gitHubIssuesList: gitHubIssuesList,
          isLoading: isLoading,
        );
      }),
    );
  }
}
