import 'package:get/get.dart';

import '../../face_recognition/camera_page.dart';

class SettingController extends GetxController {
  var isLoading = false.obs;

  void onInit() {
    super.onInit();
  }

  doRegisFaceID() async {
    Get.to(const FaceScanScreen());
  }
}
