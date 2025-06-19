import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:idexch/core/services/LoginService.dart';
import 'package:idexch/core/utils/DBHelper.dart';
import 'package:idexch/models/login_response.dart';

class LoginProvider with ChangeNotifier {
  late final LoginService _loginService;

  LoginProvider() {
    _loginService = LoginService(Dio());
  }
  bool isLoading = false;
  String? errorMessage;
  LoginResponse? loginResponse;
  Future<bool> login(
    String username,
    String password,
    String captcha,
    String expireTime,
  ) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      loginResponse = await _loginService.login(
        username: username,
        password: password,
        captcha: captcha,
        expireTime: expireTime,
      );
      if (loginResponse!.status && loginResponse!.token.isNotEmpty) {
        // Login successful
        // debugPrint("Welcome ${loginResponse!.user.name}");
        // debugPrint("Token: ${loginResponse!.token}");
        await DBHelper.clearUser();
        await DBHelper.saveUser(loginResponse!.user.name, loginResponse!.token);
        return true;
      } else {
        errorMessage = "Invalid credentials or token missing.";
      }
    } on DioError catch (e) {
      errorMessage = e.response?.data['message'] ?? "Login failed.";
    } catch (e) {
      errorMessage = "Login failed: ${e.toString()}";
    } finally {
      isLoading = false;
      notifyListeners();
    }

    return false;
  }
}
