import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/core/constants/app_constants.dart';
import 'package:ecommerce_app/app/data/models/response_model.dart';
import 'package:ecommerce_app/app/data/models/user_model.dart';
import 'package:ecommerce_app/app/data/services/api_services.dart';

class UserRepository {
  final ApiServices _apiServices = ApiServices();
  CancelToken? _cancelToken;

  // Get All Users
  Future<ApiResponse<List<UserModel>>> getAllUsers() async {
    _cancelToken = CancelToken();

    final quearyParameters = <String, dynamic>{};

    return _apiServices.getList<UserModel>(
      AppConstants.users,
      (json) => UserModel.fromJson(json),
      queryParameters: quearyParameters.isNotEmpty ? quearyParameters : null,
      cancelToken: _cancelToken,
    );
  }

  // Get User by ID
  Future<ApiResponse<UserModel>> getUserById(int id) async {
    _cancelToken = CancelToken();

    return _apiServices.get<UserModel>(
      '${AppConstants.users}/$id',
      (json) => UserModel.fromJson(json),
      cancelToken: _cancelToken,
    );
  }

  // create new User
  Future<ApiResponse<UserModel>> createUser(UserModel user) async {
    _cancelToken = CancelToken();

    return _apiServices.post<UserModel>(
      AppConstants.users,
      (json) => UserModel.fromJson(json),
      data: user.toJson(),
      cancelToken: _cancelToken,
    );
  }

  // Update User
  Future<ApiResponse<UserModel>> updateUser(UserModel user) async {
    _cancelToken = CancelToken();

    return _apiServices.put<UserModel>(
      '${AppConstants.users}/${user.id}',
      (json) => UserModel.fromJson(json),
      data: user.toJson(),
      cancelToken: _cancelToken,
    );
  }

  // Delete User
  Future<ApiResponse<bool>> deleteUser(int id) async {
    _cancelToken = CancelToken();

    return _apiServices.delete<bool>(
      '${AppConstants.users}/$id',
      (json) => true,
      cancelToken: _cancelToken,
    );
  }

  // cancel request
  void cancelRequest() {
    _cancelToken?.cancel("Request cancelled by user");
  }
}
