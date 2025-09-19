import 'package:dio/dio.dart';
import 'package:movies/Core/network/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(url,
        data: data,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ));
  }

  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio.patch(url,
        data: data,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ));
  }
}
