import 'package:flutter/material.dart';
import 'package:github_issues_flutter_app_test/core/extensions/build_context.dart';
import 'package:github_issues_flutter_app_test/core/resources/resources.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/data/models/github_issues_response.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/widgets/github_issue_label_widget.dart';

class GitHubIssueTile extends StatelessWidget {
  const GitHubIssueTile({super.key, required this.gitHubIssuesResponse});

  final GitHubIssuesResponse gitHubIssuesResponse;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: Text(
        gitHubIssuesResponse.title ?? '',
        style: context.textTheme.titleLarge?.copyWith(
          color: AppColors.headlineTextColor,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            gitHubIssuesResponse.title ?? '',
            style: context.textTheme.titleSmall?.copyWith(
              color: AppColors.textGreyColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          gitHubIssuesResponse.labels != null
              ? GitHubIssueLabelWidget(labels: gitHubIssuesResponse.labels!)
              : const SizedBox.shrink()
        ],
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            gitHubIssuesResponse.createdAt ?? '',
            style: context.textTheme.titleSmall,
          ),
          Text(
            gitHubIssuesResponse.user?.login ?? '',
            style: context.textTheme.titleSmall?.copyWith(
              color: AppColors.textGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
