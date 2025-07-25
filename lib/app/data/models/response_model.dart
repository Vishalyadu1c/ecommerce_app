class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  final int? statusCode;
  final Map<String, dynamic>? error;

// normal constructor
  ApiResponse(
      {required this.success,
      required this.message,
      this.data,
      this.statusCode,
      this.error});


  // factory constructors for success and error responses
  factory ApiResponse.success(T data, {String? message}) {
    return ApiResponse<T>(
      success: true,
      message: message ?? 'Success',
      data: data,
      statusCode: 200,
    );
  }

  factory ApiResponse.error(String message,
      {int? statusCode, Map<String, dynamic>? error}) {
    return ApiResponse<T>(
      success: false,
      message: message,
      statusCode: statusCode,
      error: error,
    );
  }
}
