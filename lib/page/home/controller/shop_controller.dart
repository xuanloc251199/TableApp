import 'package:get/get.dart';

import '../../../network_service/request_service.dart';
import '../model/shop.dart';

class ShopController extends GetxController {
  var isLoading = true.obs;
  var shopList = <Shop>[].obs;

  @override
  void onInit() {
    fetchShop();
    super.onInit();
  }

  void fetchShop() async {
    try {
      isLoading(true);
      var shops = await RequestService.fetchShop();
      if (shops != null) {
        shopList.value = shops;
      }
    } finally {
      isLoading(false);
    }
  }
}
