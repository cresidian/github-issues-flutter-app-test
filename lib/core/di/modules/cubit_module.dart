import 'package:github_issues_flutter_app_test/features/github_issues/presentation/cubit/github_issues_cubit.dart';
import 'package:kiwi/kiwi.dart';

abstract class CubitModule {
  static late KiwiContainer _container;

  static void setup(KiwiContainer container) {
    _container = container;

    _registerGitHubIssuesCubit();
  }

  static void _registerGitHubIssuesCubit() {
    _container.registerSingleton(
        (_) => GitHubIssuesCubit(gitHubIssuesRepository: _container.resolve()));
  }
}
