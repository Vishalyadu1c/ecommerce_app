// ignore_for_file: prefer_final_fields

import 'package:ecommerce_app/app/core/helpers.dart';
import 'package:ecommerce_app/app/data/models/user_model.dart';
import 'package:ecommerce_app/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserRepository _userRepository = UserRepository();

  // Reactive variable
  final RxList<UserModel> users = <UserModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers(); // Fetch users when the controller is initialized
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';

      final response = await _userRepository.getAllUsers();

      if (response.success && response.data != null) {
        users.assignAll(response.data!);
      } else {
        hasError.value = true;
        errorMessage.value = response.message;
        AppHelpers.showSnackbar(
            title: 'Error', message: response.message, isError: true);
      }
    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'An unexpected error occurred: ${e.toString()}';
      AppHelpers.showSnackbar(
          title: 'Error', message: errorMessage.value, isError: true);
    } finally {
      isLoading.value = false;
    }
  }

  // its for refreshing the user list
  Future<void> refreshUsers() async {
    await fetchUsers();
  }

//  get user by id
  Future<UserModel?> getUserById(int id) async {
    try {
      isLoading.value = true;

      final response = await _userRepository.getUserById(id);
      if (response.success && response.data != null) {
        return response.data;
      } else {
        AppHelpers.showSnackbar(
            title: 'Error', message: response.message, isError: true);
        return null;
      }
    } catch (e) {
      AppHelpers.showSnackbar(
          title: 'Error',
          message: 'An error occurred: ${e.toString()}',
          isError: true);
      return null;
    } finally {
      isLoading.value = false;
    }
  }


  // its for clearing the user in list
  Future<void> deleteUser(int id) async {
    try {
      isLoading.value = true;
      
      final response = await _userRepository.deleteUser(id);

      if (response.success) {
        users.removeWhere((user) => user.id == id);
        AppHelpers.showSnackbar(
            title: 'Success', message: 'User deleted successfully');
      } else {
        AppHelpers.showSnackbar(
            title: 'Error', message: response.message, isError: true);
      }
    } catch (e) {
      AppHelpers.showSnackbar(
          title: 'Error', message: errorMessage.value, isError: true);
    } finally {
      isLoading.value = false;
    }
  }

}
