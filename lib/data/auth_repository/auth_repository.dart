import '../../main.dart';
import '../../models/user_model.dart';

class AuthRepository {
  Future<UserModel> login(String email, String password) async {
    final response = await networkRepository.post(url: "/login", data: {
      "email": email,
      "password": password,
      "user_type": "individual",
    });

    if (response.failed) {
      throw Exception(response.message);
    }

    final userData = response.data['data'];
    return UserModel.fromJson(userData);
  }
}
