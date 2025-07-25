import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/data/models/response_model.dart';
import 'package:ecommerce_app/app/data/providers/api_provider.dart';

class ApiServices {
  final ApiProvider _apiProvider = ApiProvider();


  // Generic method to handle API calls
  Future<ApiResponse<T>> handleApiCall<T>(
    Future<Response> Function() apiCall,
    T Function(dynamic) fromJson,
  ) async {
    try {
      final response = await apiCall();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = fromJson(response.data);
        return ApiResponse.success(data);
      } else {
        return ApiResponse.error(
            'Request failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return ApiResponse.error(e.message ?? 'Network error occurred');
    } catch (e) {
      return ApiResponse.error('Unexpected error: $e');
    }
  }

  // Generic method to handle List API calls
  Future<ApiResponse<List<T>>> handleListApiCall<T>(
    Future<Response> Function() apiCall,
    T Function(dynamic) fromJson,
  ) async {
    try {
      final response = await apiCall();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonList = response.data;
        final List<T> dataList = jsonList.map((json) => fromJson(json)).toList();
        return ApiResponse.success(dataList);
      } else {
        return ApiResponse.error(
            'Request failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return ApiResponse.error(e.message ?? 'Network error occurred');
    } catch (e) {
      return ApiResponse.error('Unexpected error: $e');
    }
  }


  // Specific Get Method
  Future<ApiResponse<T>> get<T>(
    String endPoint,
    T Function(dynamic) fromJson,
    {Map<String,dynamic>?queryParameters,
    CancelToken? cancelToken}
  )async{
    return handleApiCall<T>(
      ()=>_apiProvider.get(
        endPoint,
        queryParameters: queryParameters,
        cancelToken:cancelToken
      )
      , fromJson);
  }


// Specific Get Method for List
  Future<ApiResponse<List<T>>> getList<T>(
    String endPoint,
    T Function(dynamic) fromJson,
   { Map<String,dynamic>?queryParameters,
    CancelToken? cancelToken}
  )async{
    return handleListApiCall<T>(
      ()=>_apiProvider.get(
        endPoint,
        queryParameters: queryParameters,
        cancelToken:cancelToken
      )
      , fromJson);
  }


  // Specific Post Method
  Future<ApiResponse<T>> post<T>(
    String endPoint,
    T Function(dynamic) fromJson,
    {
    dynamic data,  
    Map<String,dynamic>?queryParameters,
    CancelToken? cancelToken}
  )async{
    return handleApiCall(
      ()=>_apiProvider.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        cancelToken:cancelToken
      )
      , fromJson);
  }


// Specific Put Method
  Future<ApiResponse<T>> put<T>(
    String endPoint,
    T Function(dynamic) fromJson,
    {
    dynamic data,  
    Map<String,dynamic>?queryParameters,
    CancelToken? cancelToken}
  )async{
    return handleApiCall(
      ()=>_apiProvider.put(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        cancelToken:cancelToken
      )
      , fromJson);
  }


// Specific Delete Method
  Future<ApiResponse<T>> delete<T>(
    String endPoint,
    T Function(dynamic) fromJson,
   {
    dynamic data,
    Map<String,dynamic>?queryParameters,
    CancelToken? cancelToken}
  )async{
    return handleApiCall(
      ()=>_apiProvider.delete(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        cancelToken:cancelToken
      )
      , fromJson);
  }

}
