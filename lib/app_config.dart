class AppConfig {
  static AppConfig get instance {
    if (_instance == null) {
      const apiKey = String.fromEnvironment('API_KEY');
      const baseUrl = String.fromEnvironment('BASE_URL');
      const token = String.fromEnvironment('TOKEN');
      _instance = AppConfig._internal(apiKey, baseUrl, token);
      return _instance!;
    }
    return _instance!;
  }

  static AppConfig? _instance;

  AppConfig._internal(this.apiKey, this.baseUrl, this.token);

  final String apiKey;
  final String baseUrl;
  final String token;
}
