class AppConstants {
  static const baseUrl = "https://jsonplaceholder.typicode.com";
  static const apiVersion = "/v1";
  static const fullBaseUrl = "$baseUrl$apiVersion";

  // Endpoints
  static const users = "/users";
  static const api2 = "/api2";
  static const api3 = "/api3";

  // Hearders
  static const String containtType = "application/json";
  static const String authorization = "Authorization";
  static const String acceptLanguage = "Accept-Language";

  // Timeout
  static const int connectTimeoutMs = 15000;
  static const int receiveTimeoutMs = 15000;
  static const int sendTimeoutMs = 15000;
}
