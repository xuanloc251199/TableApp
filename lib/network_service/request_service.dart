import 'dart:async';
import 'dart:convert';

import '../../data/network/network_config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../page/home/model/product.dart';
import '../page/home/model/shop.dart';
import '../page/user/model/user_profile.dart';

class RequestService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProduct() async {
    var reponse = await client.get(Uri.parse(NetworkConfig.API_ALL_PRODUCT));

    if (reponse.statusCode == 200) {
      var jsonString = reponse.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }

  // static fetchProductByShop({
  //   required id,
  // }) async {
  //   var reponse = await client.post(
  //     Uri.parse(NetworkConfig.API_PRODUCT_BY_SHOP + "?id_shop="),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(<String, String>{
  //       "id_shop": id,
  //     }),
  //   );

  //   if (reponse.statusCode == 200) {
  //     var jsonString = reponse.body;
  //     var products = productFromJson(jsonString);
  //     return products;
  //   } else {
  //     return null;
  //   }
  // }

  static Future<UserProfile?> fetchUserProfile() async {
    var reponse = await client.get(Uri.parse(NetworkConfig.API_USER_PROFILE));

    if (reponse.statusCode == 200) {
      var jsonString = reponse.body;
      return userProfileFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<Shop>?> fetchShop() async {
    var reponse = await client.get(Uri.parse(NetworkConfig.API_SHOP));

    if (reponse.statusCode == 200) {
      var jsonString = reponse.body;
      return shopFromJson(jsonString);
    } else {
      return null;
    }
  }
}
