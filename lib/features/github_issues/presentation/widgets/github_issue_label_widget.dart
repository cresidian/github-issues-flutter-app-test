import 'package:flutter/material.dart';
import 'package:github_issues_flutter_app_test/core/extensions/build_context.dart';
import 'package:github_issues_flutter_app_test/core/resources/colors.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/data/models/github_issues_response.dart';

class GitHubIssueLabelWidget extends StatelessWidget {
  const GitHubIssueLabelWidget({super.key, required this.labels});
  final List<Labels> labels;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        labels.length > 2 ? 2 : labels.length,
        (index) => Container(
          width: 70,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(top: 2, right: 2),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            labels[index].name ?? '',
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.textColorWhite,
              fontSize: 10,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
