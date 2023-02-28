// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

class UserProfile {
  int id;
  String username;
  String name;
  String email;
  String pic;
  dynamic phone;
  Uint8List image;

  UserProfile({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.pic,
    this.phone,
    required this.image,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json["id"],
      username: json["username"],
      name: json["name"],
      email: json["email"],
      pic: json["pic"],
      phone: json["phone"],
      image: base64Decode(json["image"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "email": email,
        "pic": pic,
        "phone": phone,
        "image": base64Encode(image),
      };
}

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());
