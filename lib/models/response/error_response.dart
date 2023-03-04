import 'dart:convert';

class ErrorResponse {
  ErrorResponse({
    required this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        error: json['password'],
      );

  factory ErrorResponse.fromRawJson(String str) =>
      ErrorResponse.fromJson(json.decode(str));

  String error;

  String toRawJson() => json.encode(toJson());

  // ignore: always_specify_types
  Map<String, dynamic> toJson() => {
        'password': error,
      };
}
