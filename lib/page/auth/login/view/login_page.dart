import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../values/colors.dart';
import '../../../../values/dimen.dart';
import '../../../../values/fonts.dart';
import '../../../../values/images.dart';
import '../../../../values/strings.dart';
import '../../../../values/styles.dart';
import '../../../../widgets/button_gradient_widget.dart';
import '../../../../widgets/text_customized.dart';
import '../../../../widgets/text_field_widget.dart';
import '../../sign_up/view/sign_up_page.dart';
import '../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  // const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<LoginController>(
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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: _buildInputForm(),
              ),
            ),
            Positioned(
              child: Obx(
                () => controller.isLoading.value == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(""),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5.0.h,
                ),
                Image.asset(
                  logoApp,
                ),
                Text(
                  name_app,
                  style: TextStyle(
                    fontFamily: vigaRegular,
                    color: mainDarkColor,
                    fontWeight: FontWeight.w500,
                    fontSize: largeSize,
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Text(
                  LOGIN_TITLE,
                  style: TextStyle(
                    fontSize: largeSize,
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                TextFieldWidget(
                  width: Get.width,
                  height: 57.0,
                  textController: controller.emailController,
                  validator: (v) {
                    return controller.validateEmail(v!);
                  },
                  onSaved: (v) {
                    controller.password = v!;
                  },
                  widthBorder: 1.5,
                  bgColor: bgWhiteColor,
                  hint: EMAIL,
                  hintTextStytle: inputHintTextStyle,
                  borderColor: mainDarkColor,
                  inputBoxShadow: const BoxShadow(
                    color: shadowColor,
                    offset: Offset(15, 20),
                    blurRadius: 45,
                    spreadRadius: 0.1,
                  ),
                  isEnable: true,
                ),
                controller.emailValid
                    ? Container(
                        padding: EdgeInsets.only(top: 2.0.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustomized(
                              text: controller.error,
                              weight: FontWeight.w500,
                              font: robotoRegular,
                              color: mainDarkColor,
                              size: verySmallSize,
                              textAlign: TextAlign.left,
                            )
                          ],
                        ))
                    : Container(),
                SizedBox(
                  height: 2.0.h,
                ),
                TextFieldWidget(
                  width: Get.width,
                  height: 57.0,
                  textController: controller.passwordController,
                  validator: (v) {
                    return controller.validatePassword(v!);
                  },
                  onSaved: (v) {
                    controller.password = v!;
                  },
                  widthBorder: 1.5,
                  bgColor: bgWhiteColor,
                  hint: PASSWORD,
                  textInputType: TextInputType.visiblePassword,
                  isObscureText: true,
                  hintTextStytle: inputHintTextStyle,
                  borderColor: mainDarkColor,
                  inputBoxShadow: const BoxShadow(
                    color: shadowColor,
                    offset: Offset(15, 20),
                    blurRadius: 45,
                    spreadRadius: 0.1,
                  ),
                  isEnable: true,
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                const Text(
                  CONTINUE_WITH,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                Container(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          faceId,
                        ),
                        onTap: () async {
                          controller.doAuthFaceId();
                        },
                      ),
                      // SizedBox(width: 15.0.w),
                      // GestureDetector(
                      //   child: Image.asset(
                      //     fingerprint,
                      //   ),
                      //   onTap: () async {
                      //     controller.doAuthTouchId();
                      //   },
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                const Text(
                  FORGOT_PASSWORD,
                  style: TextStyle(
                      color: mainDarkColor,
                      decoration: TextDecoration.underline),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(SignUpPage());
                  },
                  child: const Text(
                    SIGN_UP,
                    style: TextStyle(
                      color: mainDarkColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                ButtonGradientWidget(
                  toUpperCase: true,
                  text: LOGIN,
                  onPressed: () async {
                    controller.doLogin();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
