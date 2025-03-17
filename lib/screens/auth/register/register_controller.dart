import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/data/auth_repository/auth_repository.dart';
import 'package:taxi_booking/main.dart';
import 'package:taxi_booking/screens/main/book_ride/booking_screen.dart';

import '../../../models/signup_model.dart';
import '../verify_email.dart';

class RegisterController extends GetxController {
  final signUpUser = SignupModel();
  RxBool isLoading = false.obs;
  final otpValues = List.generate(5, (index) => "");

  final authRepository = AuthRepository();

  Future<void> register() async {
    try {
      isLoading.value = true;
      final message = await authRepository.register(signUpUser);
      if (message != null) {
        Get.to(() => VerifyEmail());
        Get.snackbar(
          "Success",
          "${message}",
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

  Future<void> verifyOtp() async {
    try {
      final user = await authRepository.verifyOtp(
        email: signUpUser.email,
        otp: otpValues.join(),
      );
      if (user != null) {
        appStorage.write("user", user.toJson());
        Get.to(() => BookingScreen());
        Get.snackbar(
          "Success",
          "Otp Verified Successfully",
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
