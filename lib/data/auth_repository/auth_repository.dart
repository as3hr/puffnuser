import 'package:taxi_booking/models/signup_model.dart';

import '../../main.dart';
import '../../models/user_model.dart';

class AuthRepository {
  Future<UserModel> login(String email, String password) async {
    final response = await networkRepository.post(url: "/login", data: {
      "email": email,
      "password": password,
      "user_type": "customer",
    });

    if (response.failed) {
      throw Exception(response.message);
    }

    final userData = response.data['data'];
    return UserModel.fromJson(userData);
  }

  Future<UserModel> register(SignupModel user) async {
    final response =
        await networkRepository.post(url: "/register", data: user.toJson());

    if (response.failed) {
      throw Exception(response.message);
    }

    final userData = response.data['data'];
    return UserModel.fromJson(userData);
  }
}
