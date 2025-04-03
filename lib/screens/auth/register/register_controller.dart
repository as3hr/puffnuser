import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/data/auth_repository/auth_repository.dart';
import 'package:taxi_booking/screens/auth/login/login_screen.dart';

import '../../../models/signup_model.dart';
import '../verify_email.dart';

class RegisterController extends GetxController {
  final signUpUser = SignupModel();
  RxBool isLoading = false.obs;
  RxBool isOtpLoading = false.obs;
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
    isOtpLoading.value = true;
    try {
      final response = await authRepository.verifyOtp(
        email: signUpUser.email,
        otp: otpValues.join(),
      );
      if (response) {
        Get.offUntil(GetPageRoute(page: () => LoginScreen()), (_) => false);
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
      isOtpLoading.value = false;
    }
  }
}
