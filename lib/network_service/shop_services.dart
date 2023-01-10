import 'package:http/http.dart' as http;

import '../data/network/network_config.dart';
import '../page/home/model/shop.dart';

class ShopServices {
  static var client = http.Client();

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
