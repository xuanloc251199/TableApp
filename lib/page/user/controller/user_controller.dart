import 'package:get/get.dart';

import '../../../network_service/request_service.dart';
import '../model/user_profile.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userProfile = UserProfile;

  @override
  void onInit() {
    fetchUserProfile();
    super.onInit();
  }

  void fetchUserProfile() async {
    try {
      isLoading(true);
      var userProfiles = await RequestService.fetchUserProfile();
      if (userProfiles != null) {
        userProfile = userProfiles as Type;
      }
    } finally {
      isLoading(false);
    }
  }
}
