import 'package:dio/dio.dart';
import 'package:idexch/core/constants/strings.dart';
import 'package:idexch/models/logout_response.dart';

class LogoutService {
  final Dio _dio;

  LogoutService(this._dio);

  Future<LogoutResponse> logout(String? token) async {
    print("tokenss  ${token}");

    try {
      final response = await _dio.post(
      ImportantLinks.SHAPILINK+ApiEndpoints.LOGOUT,
        data: {},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      return LogoutResponse.fromJson(response.data);
    } catch (e) {
      rethrow; // Or handle the error appropriately
    }
  }
}
