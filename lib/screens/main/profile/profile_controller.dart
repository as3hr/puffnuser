import 'dart:convert';

import 'package:get/get.dart';
import 'package:taxi_booking/models/user_model.dart';

import '../../../main.dart';

class ProfileController extends GetxController {
  late UserModel user;

  @override
  void onInit() {
    super.onInit();
    final data = appStorage.read("user");
    if (data != null) {
      final json = jsonDecode(data);
      user = UserModel.fromJson(json);
    }
  }
}
