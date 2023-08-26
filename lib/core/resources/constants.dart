class Constants {
  Constants._();

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const double textHeight = 1.5;
  static const Duration userSessionTimeOutDuration = Duration(minutes: 5);
  static bool isGuest = false;
  static const channel = 'flutter_channel';

  static int perPage = 10;
}
