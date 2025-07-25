// ignore_for_file: unrelated_type_equality_checks

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/core/constants/app_constants.dart';
import 'package:ecommerce_app/app/data/services/storage_service.dart';
import 'package:get/get.dart' as getx;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  static ApiProvider? _instance;
  late Dio _dio;
  final _storageService = getx.Get.find<StorageService>();

  ApiProvider._internam() {
    _dio = Dio();
    _initializeIntercenptor();
  }

  // Factory constructor to return the same instance
  factory ApiProvider(){
    _instance ??= ApiProvider._internam();
    return _instance!;
  }

  void _initializeIntercenptor() {
    _dio.options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: Duration(milliseconds: AppConstants.connectTimeoutMs),
        receiveTimeout: Duration(milliseconds: AppConstants.receiveTimeoutMs),
        sendTimeout: Duration(milliseconds: AppConstants.sendTimeoutMs),
        headers: {
          'Content-Type': AppConstants.containtType,
          'Accept': AppConstants.containtType,
        });

    // request interceptor

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add auth token if available!
        final token = _storageService.getToken();
        if (token != null) {
          options.headers[AppConstants.authorization] = 'Bearer $token';
        }

        // Add language header
        final language = _storageService.getLanguage() ?? 'en';
        options.headers[AppConstants.acceptLanguage] = language;

        // check connectivity

        final connectivity = Connectivity().checkConnectivity();
        if (connectivity == ConnectivityResult.none) {
          throw DioException(
            requestOptions: options,
            type: DioExceptionType.connectionError,
            message: 'No internet connection',
          );
        }
        handler.next(options);
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          await _handleTokenExpiration();
        }
        handler.next(error);
      },
    ));

    // longer interceptor (only for debug mode)
    if (getx.Get.isLogEnable) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ));
    }
  }

  Future<void> _handleTokenExpiration() async {
    _storageService.removeToken();

    // navigate to login page if the token is expired
    getx.Get.offAllNamed('/login');
  }

  // create api call

  // Generic GET request method
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Generic POST request method
  Future<Response> post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final response = await _dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Generic PUT request method
  Future<Response> put(String path,
      {
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final response = await _dio.put(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Generic DELETE request method
  Future<Response> delete(String path,
      {
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final response = await _dio.delete(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }


  // Handle errors
  _handleError(dynamic error){
    if(error is DioException){
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          throw Exception('Connection timeout.');
        case DioExceptionType.sendTimeout:
          throw Exception('Send timeout.');
        case DioExceptionType.receiveTimeout:
          throw Exception('Receive timeout.');
        case DioExceptionType.badResponse:
          throw Exception(_hanldeStatusCode(error.response?.statusCode));
        case DioExceptionType.cancel:
          throw Exception('Request cancelled.');
        case DioExceptionType.unknown:
          throw Exception('Unknown error occurred.');
        default:
          throw Exception('Somthing went wrong.');
      }
    }
  }


  _hanldeStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Unauthorized.';
      case 403:
        return 'Forbidden.';
      case 404:
        return 'Not found.';
      case 409:
        return 'Conflict occurred.';
      case 500:
        return 'Internal server error.';
      case 502:
        return 'Bad gateway.';
      case 503:
        return 'Service unavailable.';
      default:
        return 'Something went wrong.';
    }
  }

  
}
