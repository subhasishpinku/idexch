import 'package:dio/dio.dart';
import 'package:idexch/core/constants/strings.dart';
import 'package:idexch/models/login_response.dart';

class LoginService {
  final Dio _dio;

  LoginService(this._dio);

  Future<LoginResponse> login({
    required String username,
    required String password,
    required String captcha,
    required String expireTime,
  }) async { 
    final response = await _dio.post(
      ImportantLinks.SHAPILINK+ApiEndpoints.LOGIN,
      data: {
        'username': username,
        'password': password,
        'captcha': captcha,
        'expireTime': expireTime,
      },
    );

    return LoginResponse.fromJson(response.data);
  }
}
