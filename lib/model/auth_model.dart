class AuthModel {
  String token;
  String refreshToken;
  bool success;
  List<dynamic> errors;

  AuthModel({
    required this.token,
    required this.refreshToken,
    required this.success,
    required this.errors,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json["token"],
      refreshToken: json["refreshToken"],
      success: json["success"],
      errors: json["errors"],
    );
  }
}
