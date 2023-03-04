import 'dart:convert';

class LoginRequest {
  LoginRequest({
    required this.email,
    required this.password,
  });

  String? email;
  String? password;

  // ignore: sort_constructors_first
  factory LoginRequest.fromRawJson(String str) =>
      LoginRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  // ignore: sort_constructors_first
  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json['user_email'],
        password: json['user_password'],
      );

  Map<String, dynamic> toJson() => {
        // 'user_email': email,
        // 'user_password': password,
        'user_email': email,
        'user_password': password,
      };
}
