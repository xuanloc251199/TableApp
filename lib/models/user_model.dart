import 'dart:convert';

import '../../models/user.dart';

UserModel userFromJson(String str) => UserModel.toObject(json.decode(str));

class UserModel {
  User user;
  String token;

  UserModel({required this.user, required this.token});

  factory UserModel.toObject(Map<String, dynamic> json) => UserModel(
        user: User.toObject(json['user']),
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}
