import 'dart:convert';

class TokenController {
  TokenController({
    required this.refresh,
    required this.access,
  });

  String refresh;
  String access;

  factory TokenController.fromJson(Map<String, dynamic> json) =>
      TokenController(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}

TokenController tokenControllerFromJson(String str) =>
    TokenController.fromJson(json.decode(str));

String tokenControllerToJson(TokenController data) =>
    json.encode(data.toJson());
