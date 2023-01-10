import 'package:get/get.dart';

// import '../../login_page.dart';

import '../../auth/login/view/login_page.dart';

class SplashController extends GetxController {
  void onInit() {
    super.onInit();
    splashAction();
  }

  void splashAction() async {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Get.offAll(LoginPage());
      },
    );
  }
}
