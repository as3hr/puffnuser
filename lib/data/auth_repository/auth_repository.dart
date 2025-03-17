import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/models/signup_model.dart';

import '../../main.dart';
import '../../models/user_model.dart';

class AuthRepository {
  Future<UserModel?> login(String email, String password) async {
    final response =
        await networkRepository.post(url: "/customer/login", data: {
      "email": email,
      "password": password,
      "user_type": "customer",
    });

    if (response.failed) {
      Get.snackbar(
        "Error",
        response.message ?? "",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      return null;
    } else {
      final data = response.data['data'];
      return UserModel.fromJson(data);
    }
  }

  Future<String?> register(SignupModel user) async {
    final response = await networkRepository.post(
        url: "/customer/register", data: user.toJson());

    if (response.failed) {
      Get.snackbar(
        "Error",
        response.message ?? "",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      return null;
    } else {
      final message = response.data['message'];
      return message;
    }
  }

  Future<UserModel?> verifyOtp(
      {required String email, required String otp}) async {
    final response = await networkRepository.post(
      url: "/customer/verify-otp",
      data: {
        "email": email,
        "otp": otp,
      },
    );

    if (response.failed) {
      Get.snackbar(
        "Error",
        response.message ?? "",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      return null;
    } else {
      final data = response.data['data'];
      return UserModel.fromJson(data);
    }
  }

  Future<void> logout() async {
    await networkRepository.post(url: "/logout");
  }
}
