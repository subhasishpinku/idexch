import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:idexch/core/services/logoutService.dart';
import 'package:idexch/core/utils/DBHelper.dart';
import 'package:idexch/models/logout_response.dart';

class LogoutProvider with ChangeNotifier {
  late final LogoutService _logoutService;

  LogoutProvider() {
    _logoutService = LogoutService(Dio());
  }

  bool isLoading = false;
  String? errorMessage;
  LogoutResponse? logoutResponse;
  String? username;
  String? token;
  String? message;
  bool status = true;
  Future<bool> logout(String? token) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      logoutResponse = await _logoutService.logout(token);
      message = logoutResponse?.message ?? "Logout success";
      status = logoutResponse?.status ?? false;
      print("Logout status: $status");

      await DBHelper.clearUser();
      return status;
    } catch (e) {
      errorMessage = "Logout failed: $e";
      status = false;
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  
}
