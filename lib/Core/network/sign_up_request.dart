import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movies/Core/network/api_constants.dart';
import 'package:movies/Core/network/end_points.dart';
import 'package:movies/Core/services/snackbar_services.dart';

class SignUpRequest extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> registerRequest() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiConstants.baseUrl + EndPoints.signUp);
      Map toJson = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'confirmPassword': confirmPasswordController.text,
        'avatarId': 1,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(toJson), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        SnackBarService.showSuccessMessage("Created Account Successfully");
      } else {
        SnackBarService.showErrorMessage(response.body);
        throw jsonDecode(response.body)['message'] ?? 'Something went wrong';
      }
    } catch (e) {
      SnackBarService.showErrorMessage(e.toString());
    }
  }
}
