import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movies/Core/network/api_constants.dart';
import 'package:movies/Core/network/end_points.dart';
import 'package:movies/Core/services/snackbar_services.dart';

class SignInRequest extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginRequest() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiConstants.baseUrl + EndPoints.signIn);
      Map toJson = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(toJson), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        emailController.clear();
        passwordController.clear();
        SnackBarService.showSuccessMessage("Logged In Successfully");
      } else {
        SnackBarService.showErrorMessage(response.body);
        throw jsonDecode(response.body)['message'] ?? 'Something went wrong';
      }
    } catch (e) {
      Get.back();
      SnackBarService.showErrorMessage(e.toString());
    }
  }
}
