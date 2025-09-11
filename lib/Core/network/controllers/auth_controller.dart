import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:movies/Core/network/auth_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var token = ''.obs;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
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
          avatarId: 1);

      if (response.statusCode == 200) {
        EasyLoading.showSuccess('Account created successfully');
      } else {
        EasyLoading.showError(response.data["message"] ?? "Register failed");
      }
    } catch (e) {
      EasyLoading.showError("Error: $e");
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
        final data = response.data;
        token.value = data["token"];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token.value);

        EasyLoading.showSuccess("Login successful");
        Get.offAllNamed('/home_view');
      } else {
        EasyLoading.showError(response.data["message"] ?? "Login failed");
      }
    } catch (e) {
      EasyLoading.showError("Error: $e");
    } finally {
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }
}
