import 'package:face_auth_flutter/page/auth/login/view/login_page.dart';
import 'package:face_auth_flutter/page/setting/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/local_db.dart';
import '../../../values/colors.dart';
import '../../../values/dimen.dart';
import '../../../values/fonts.dart';
import '../../../values/images.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';
import '../../face_recognition/camera_page.dart';

class SettingPage extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<SettingController>(
        builder: (value) => AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: Stack(
      children: [
        Positioned(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        logoApp,
                        width: 15.0.w,
                      ),
                      SizedBox(width: 5.0.w),
                      Text(
                        name_app,
                        style: TextStyle(
                          fontFamily: vigaRegular,
                          color: mainDarkColor,
                          fontWeight: FontWeight.w500,
                          fontSize: largeSize,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0.h),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(avatar),
                        radius: 10.0.h,
                        backgroundColor: mainDarkColor,
                      ),
                      SizedBox(height: 2.0.h),
                      Text(
                        "Hi ${LocalDB.getUser().name} 👋",
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: mediumXSize,
                          fontFamily: robotoRegular,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5.0.h),
                  Row(
                    children: [
                      Image(
                        image: AssetImage(ic_user),
                        width: 7.0.w,
                      ),
                      SizedBox(width: 5.0.w),
                      Text(SETTING_PER)
                    ],
                  ),
                  SizedBox(height: 4.0.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(const FaceScanScreen());
                    },
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(ic_face_id),
                          width: 7.0.w,
                        ),
                        SizedBox(width: 5.0.w),
                        Text(SETTING_FACE_ID)
                      ],
                    ),
                  ),
                  SizedBox(height: 4.0.h),
                  Row(
                    children: [
                      Image(
                        image: AssetImage(fingerprint),
                        width: 7.0.w,
                      ),
                      SizedBox(width: 5.0.w),
                      Text(SETTING_TOUCH_ID)
                    ],
                  ),
                  SizedBox(height: 4.0.h),
                  GestureDetector(
                    onTap: (() {
                      Get.to(LoginPage());
                    }),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(ic_logout),
                          width: 7.0.w,
                        ),
                        SizedBox(width: 5.0.w),
                        Text(SETTING_LOGOUT)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
