import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../values/colors.dart';
import '../../chat/view/chat_page.dart';
import '../../home/view/home_page.dart';
import '../../setting/view/setting_page.dart';
import '../../user/view/user_page.dart';
import '../model/navigate_emblem.dart';

class MainController extends GetxController {
  int currentPage = 0;

  void onInit() {
    super.onInit();
  }

  void onChangePage(int index) {
    currentPage = index;

    navigateItem[index].color = activeColor;
    for (var i = 0; i < navigateItem.length; i++) {
      if (i != index) navigateItem[i].color = inActiveColor;
    }
    update();
  }

  Widget? getPage(int pos) {
    switch (pos) {
      case 0:
        return HomePage();
      case 1:
        return UserPage();
      case 2:
        return ChatPage();
      case 3:
        return SettingPage();
    }
    return null;
  }
}
