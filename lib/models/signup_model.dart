class SignupModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String confirmPassword;
  String userName;
  String phoneNumber;

  SignupModel({
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
    this.userName = "",
    this.phoneNumber = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password.trim(),
      "password_confirmation": confirmPassword.trim(),
      "username": userName,
      "phone": phoneNumber,
    };
  }
}
