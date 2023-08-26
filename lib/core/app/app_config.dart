enum Environment { dev, staging, prod }

extension XEnvironment on Environment {
  bool get isProd => this == Environment.prod;

  bool get isStaging => this == Environment.staging;

  bool get isDev => this == Environment.dev;
}

class AppConfig {
  static Environment environment = Environment.dev;
  late String baseUrl;

  AppConfig.dev() {
    environment = Environment.dev;
    baseUrl = 'https://api.github.com';
  }

  AppConfig.staging() {
    environment = Environment.staging;
    baseUrl = 'https://api.github.com';
  }

  AppConfig.prod() {
    environment = Environment.prod;
    baseUrl = 'https://api.github.com';
  }
}
