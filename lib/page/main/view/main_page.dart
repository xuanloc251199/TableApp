import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../values/colors.dart';
import '../../../values/dimen.dart';
import '../../../values/fonts.dart';
import '../controller/main_controller.dart';
import '../model/navigate_emblem.dart';

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (value) => Scaffold(
        body: _buildBody(controller.currentPage),
        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }

  Widget? _buildBody(int selectedPageIndex) =>
      controller.getPage(selectedPageIndex);

  Widget _buildBottomNavigation() => BottomNavyBar(
        backgroundColor: bgWhiteColor,
        selectedIndex: controller.currentPage,
        itemCornerRadius: 12,
        onItemSelected: (int index) {
          controller.onChangePage(index);
        },
        items: navigateItem.map((NavigateEmblem navigateEmblem) {
          return BottomNavyBarItem(
            activeColor: activeColor,
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                navigateEmblem.image,
                color: navigateEmblem.color,
                width: 6.0.w,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                navigateEmblem.text,
                style: TextStyle(
                  fontFamily: robotoRegular,
                  fontSize: normalSize,
                  color: textBlackColor,
                ),
              ),
            ),
          );
        }).toList(),
      );
}
