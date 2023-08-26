import 'package:flutter/material.dart';

class GitHubIssuesScreenLoadingWidget extends StatelessWidget {
  const GitHubIssuesScreenLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
