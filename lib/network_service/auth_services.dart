import 'dart:convert';
import '../../data/network/network_config.dart';
import '../../models/error_response.dart';
import '../../models/login_response.dart';
import '../../models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static var client = http.Client();

  static register({
    required name,
    required email,
    required password,
    required confirmPassword,
  }) async {
    var reponse = await client.post(
      Uri.parse(NetworkConfig.API_REGISTER),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        "name": name,
        "email": email,
        "password": password,
        "c_password": confirmPassword,
      }),
    );

    if (reponse.statusCode == 200 || reponse.statusCode == 201) {
      var stringObject = reponse.body;
      var user = userFromJson(stringObject);
      return user;
    } else {
      return null;
    }
  }

  static login({
    required email,
    password,
  }) async {
    var reponse = await client.post(
      Uri.parse(NetworkConfig.API_LOGIN),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );

    if (reponse.statusCode == 200) {
      var stringObject = reponse.body;
      var user = userFromJson(stringObject);
      return user;
    } else {
      return null;
    }
  }

  // static Future<List> refreshToken({required String token}) async {
  //   var response = await client
  //       .post(Uri.parse(NetworkConfig.BASE_URL), headers: <String, String>{
  //     'Authorization': 'Bearer $token',
  //   });

  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     //status is success but not excepted result
  //     if (json.contains("access_token") == false) {
  //       return ["", "Unknown Error"];
  //     }
  //     var loginRes = loginRespFromJson(json);
  //     if (loginRes != null) {
  //       return [loginRes.accessToken, ""];
  //     } else {
  //       return ["", "Unknown Error"];
  //     }
  //   } else {
  //     var json = response.body;
  //     var errorResp = errorRespFromJson(json);
  //     if (errorResp == null) {
  //       return ["", "Unknown Error"];
  //     } else {
  //       return ["", errorResp.error];
  //     }
  //   }
  // }

  // static Future<List> login(
  //     {required String email, required String password}) async {
  //   var response = await client.post(Uri.parse("$BASE_URL/register"),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body:
  //           jsonEncode(<String, String>{"email": email, "password": password}));

  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     var loginRes = loginRespFromJson(json);
  //     if (loginRes != null) {
  //       return [loginRes.accessToken, ""];
  //     } else {
  //       return ["", "Unknown Error"];
  //     }
  //   } else {
  //     var json = response.body;
  //     var errorResp = errorRespFromJson(json);
  //     if (errorResp == null) {
  //       return ["", "Unknown Error"];
  //     } else {
  //       return ["", errorResp.error];
  //     }
  //   }
  // }
}
