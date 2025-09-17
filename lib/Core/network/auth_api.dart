import 'package:dio/dio.dart';
import 'package:movies/Core/network/end_points.dart';

import 'dio_helper_network.dart';

class AuthAPI {
  static Future<Response> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avatarId,
  }) async {
    return await DioHelper.postData(
      url: EndPoints.signUp,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "phone": phone,
        "avatarId": avatarId,
      },
    );
  }

  static Future<Response> login({
    required String email,
    required String password,
  }) async {
    return await DioHelper.postData(
      url: EndPoints.signIn,
      data: {
        "email": email,
        "password": password,
      },
    );
  }
}
