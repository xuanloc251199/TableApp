// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    required this.userDetail,
  });

  UserDetail userDetail;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        userDetail: UserDetail.fromJson(json["user-detail"]),
      );

  Map<String, dynamic> toJson() => {
        "user-detail": userDetail.toJson(),
      };
}

class UserDetail {
  UserDetail({
    required this.idUser,
    required this.address,
    required this.phoneNumber,
    required this.avt,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  int idUser;
  String address;
  String phoneNumber;
  String avt;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        idUser: json["id_user"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        avt: json["avt"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "address": address,
        "phone_number": phoneNumber,
        "avt": avt,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
