import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/screens/main/book_ride/booking_screen.dart';

import '../../../data/auth_repository/auth_repository.dart';
import '../../../main.dart';

class LoginController extends GetxController {
  final authRepository = AuthRepository();
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  String email = "";
  String password = "";

  Future<void> login() async {
    try {
      isLoading.value = true;
      final user = await authRepository.login(email, password);
      if (user != null) {
        appStorage.write("user", jsonEncode(user.toJson()));
        Get.offAll(() => BookingScreen());
        Get.snackbar(
          "Success",
          "Welcome ${user.firstName}!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
