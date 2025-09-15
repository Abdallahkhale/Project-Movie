import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:movies/Core/network/auth_api.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var token = ''.obs;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avatarId,
  }) async {
    try {
      isLoading.value = true;
      EasyLoading.show(status: 'Creating account...');

      final response = await AuthAPI.register(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          phone: phone,
          avatarId: avatarId);

      if (response.statusCode == 200) {
        EasyLoading.showSuccess('Account created successfully');
        Get.offAllNamed('/login_view');
      } else {
        EasyLoading.showError(response.data["message"] ?? "Register failed");
      }
    } on DioException catch (e) {
      EasyLoading.showError(
          e.response?.data["message"] ?? "Something went wrong");
    } finally {
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      EasyLoading.show(status: 'Logging in...');

      final response = await AuthAPI.login(email: email, password: password);

      if (response.statusCode == 200) {
        EasyLoading.showSuccess("Login successful");
        Get.offAllNamed('/home_view');
      } else {
        EasyLoading.showError(response.data["message"] ?? "Login failed");
      }
    } on DioException catch (e) {
      EasyLoading.showError(
          e.response?.data["message"] ?? "Something went wrong");
    } finally {
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }
}
