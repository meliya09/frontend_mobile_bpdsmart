import 'dart:convert';

class LoginResponse {
  LoginResponse({
    required this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json['access_token'],
      );

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String accessToken;

  String toRawJson() => json.encode(toJson());

  // ignore: always_specify_types
  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
      };
}
