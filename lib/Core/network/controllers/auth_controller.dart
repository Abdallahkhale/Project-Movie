import 'package:dio/dio.dart';
import 'package:bot_toast/bot_toast.dart';
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
      BotToast.showLoading(duration: const Duration(seconds: 2));

      final response = await AuthAPI.register(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          phone: phone,
          avatarId: avatarId);

      if (response.statusCode == 200) {
        BotToast.showText(text: 'Account created successfully', duration: const Duration(seconds: 2));
        Get.offAllNamed('/login_view');
      } else {
        BotToast.showText(text: response.data["message"] ?? "Register failed");
      }
    } on DioException catch (e) {
      BotToast.showText(
          text: e.response?.data["message"] ?? "Something went wrong");
    } finally {
      isLoading.value = false;
      BotToast.closeAllLoading();
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      BotToast.showLoading(duration: const Duration(seconds: 2));

      final response = await AuthAPI.login(email: email, password: password);

      if (response.statusCode == 200) {
        BotToast.showText(text: "Login successful", duration: const Duration(seconds: 2));
        Get.offAllNamed('/home_view');
      } else {
        BotToast.showText(text: response.data["message"] ?? "Login failed");
      }
    } on DioException catch (e) {
      BotToast.showText(
          text: e.response?.data["message"] ?? "Something went wrong");
    } finally {
      isLoading.value = false;
      BotToast.closeAllLoading();
    }
  }
}
