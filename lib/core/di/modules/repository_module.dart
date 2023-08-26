import 'package:github_issues_flutter_app_test/features/github_issues/data/repository/github_issues_repository_impl.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/domain/repository/github_issues_repository.dart';
import 'package:kiwi/kiwi.dart';

abstract class RepositoryModule {
  static late KiwiContainer _container;

  static void setup(KiwiContainer container) {
    _container = container;
    _setupGitHubIssuesRepository();
  }

  static void _setupGitHubIssuesRepository() {
    _container.registerSingleton<GithubIssuesRepository>(
      (_) => GitHubIssuesRepositoryImpl(
        restAPIClient: _container.resolve(),
      ),
    );
  }
}
