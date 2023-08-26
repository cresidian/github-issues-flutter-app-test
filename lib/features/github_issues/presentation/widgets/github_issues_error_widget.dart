import 'package:flutter/material.dart';
import 'package:github_issues_flutter_app_test/core/extensions/build_context.dart';
import 'package:github_issues_flutter_app_test/core/resources/resources.dart';

class GitHubIssuesErrorWidget extends StatelessWidget {
  const GitHubIssuesErrorWidget({
    super.key,
    this.onRetry,
    required this.errorText,
  });

  final VoidCallback? onRetry;
  final String errorText;

  void onPressedRetryButton() {
    if (onRetry != null) {
      onRetry!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.materialPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: Dimensions.materialPadding_2x,
            ),
            Text(
              errorText,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.subHeadlineTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Dimensions.materialPadding,
            ),
            ElevatedButton(
              child: const Text(
                Strings.retry,
              ),
              onPressed: () => onPressedRetryButton(),
            ),
          ],
        ),
      ),
    );
  }
}
