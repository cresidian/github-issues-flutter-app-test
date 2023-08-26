import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_issues_flutter_app_test/core/extensions/build_context.dart';
import 'package:github_issues_flutter_app_test/core/resources/colors.dart';
import 'package:github_issues_flutter_app_test/core/resources/dimens.dart';
import 'package:github_issues_flutter_app_test/core/resources/strings.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/data/models/github_issues_response.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/domain/repository/github_issues_repository.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/cubit/github_issues_cubit.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/widgets/github_issue_tile.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/widgets/progress_indicator.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/widgets/search_field.dart';

class GitHubIssueSuccessWidget extends StatefulWidget {
  const GitHubIssueSuccessWidget({
    super.key,
    required this.gitHubIssuesList,
    required this.isLoading,
  });

  final List<GitHubIssuesResponse> gitHubIssuesList;
  final bool isLoading;

  @override
  State<GitHubIssueSuccessWidget> createState() =>
      _GitHubIssueSuccessWidgetState();
}

class _GitHubIssueSuccessWidgetState extends State<GitHubIssueSuccessWidget> {
  final TextEditingController searchFieldController = TextEditingController();
  final listViewScrollController = ScrollController();

  List<GitHubIssuesResponse> filteredList = [];

  @override
  void dispose() {
    searchFieldController.dispose();
    listViewScrollController.dispose();
    super.dispose();
  }

  void setupListViewScrollController() {
    listViewScrollController.addListener(() {
      if (listViewScrollController.position.atEdge &&
          listViewScrollController.position.pixels != 0) {
        context.read<GitHubIssuesCubit>().getGitHubIssues();
      }
    });
  }

  @override
  void initState() {
    filteredList = widget.gitHubIssuesList;
    setupListViewScrollController();
    super.initState();
  }

  void onQuerySearchField(String value) {
    filteredList = widget.gitHubIssuesList
        .where((element) =>
            element.labels!.any((element) => element.name!.contains(value)))
        .toList();
    if (value.isEmpty) {
      filteredList = widget.gitHubIssuesList;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.materialPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.issuesList,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(
            height: Dimensions.materialPadding,
          ),
          SearchTextField(
            controller: searchFieldController,
            onQuery: onQuerySearchField,
          ),
          Expanded(
            child: widget.gitHubIssuesList.isEmpty
                ? _noListFound()
                : ListView.separated(
                    controller: listViewScrollController,
                    physics: const ClampingScrollPhysics(),
                    itemCount: filteredList.length + (widget.isLoading ? 1 : 0),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index < filteredList.length) {
                        return GitHubIssueTile(
                          gitHubIssuesResponse: filteredList[index],
                        );
                      } else {
                        listViewScrollController.jumpTo(
                            listViewScrollController.position.maxScrollExtent +
                                75.0);
                        return const GitHubIssuesScreenLoadingWidget();
                      }
                    },
                    separatorBuilder: (context, index) => _dividerWidget(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _noListFound() {
    return Center(
      child: Text(
        Strings.noIssueFound,
        style: context.textTheme.bodyLarge,
      ),
    );
  }

  Widget _dividerWidget() {
    return Divider(
      color: AppColors.headlineTextColor,
    );
  }
}
