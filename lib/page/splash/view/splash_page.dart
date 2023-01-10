import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../values/colors.dart';
import '../../../values/dimen.dart';
import '../../../values/fonts.dart';
import '../../../values/images.dart';
import '../../../values/strings.dart';
import '../controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<SplashController>(
        builder: (value) => AnnotatedRegion(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(),
          ),
          value: value,
        ),
      ),
    );
  }
}

class _buildBody extends StatelessWidget {
  const _buildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SplashController>(
        builder: (value) => Stack(alignment: Alignment.center, children: [
          Positioned(
            width: Get.width,
            height: Get.height,
            child: Image.asset(
              bgSplashPage,
              width: 100.0.w,
            ),
          ),
          Positioned(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  logoApp,
                ),
                Text(
                  name_app,
                  style: TextStyle(
                    fontFamily: vigaRegular,
                    color: mainDarkColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0.w,
                  ),
                ),
                Text(
                  slogan_app,
                  style: TextStyle(
                    fontFamily: semiSemiBold,
                    color: textBlackColor,
                    fontSize: normalSize,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
