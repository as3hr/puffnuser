import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/data/auth_repository/auth_repository.dart';

import '../../../main.dart';
import '../../../models/signup_model.dart';
import '../verify_email.dart';

class RegisterController extends GetxController {
  final signUpUser = SignupModel();
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  Future<void> register() async {
    try {
      isLoading.value = true;
      final user = await authRepository.register(signUpUser);
      appStorage.write("user", user.toJson());
      Get.to(() => VerifyEmail());
      Get.snackbar(
        "Success",
        "Welcome ${user.firstName}!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
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
