import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../values/colors.dart';
import '../../../../values/dimen.dart';
import '../../../../values/fonts.dart';
import '../../../../values/images.dart';
import '../../../../values/strings.dart';
import '../../../../values/styles.dart';
import '../../../../widgets/button_gradient_widget.dart';
import '../../../../widgets/text_field_widget.dart';
import '../../login/controller/login_controller.dart';
import '../../login/view/login_page.dart';
import '../controller/sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<SignUpController>(
        builder: (value) => AnnotatedRegion(
          // ignore: sort_child_properties_last
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(),
          ),
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
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
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.w),
                  child: Form(
                    key: controller.registerFormkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          logoApp,
                        ),
                        Text(
                          name_app,
                          style: TextStyle(
                            fontFamily: vigaRegular,
                            color: mainLightColor,
                            fontWeight: FontWeight.w500,
                            fontSize: largeSize,
                          ),
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        Text(
                          SIGN_UP_TITLE,
                          style: TextStyle(
                            fontSize: largeSize,
                          ),
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        TextFieldWidget(
                          textController: controller.nameController,
                          isObscureText: false,
                          onSaved: (v) {
                            controller.name = v!;
                          },
                          width: Get.width,
                          height: 57.0,
                          bgColor: bgWhiteColor,
                          hint: USERNAME,
                          hintTextStytle: inputHintTextStyle,
                          borderColor: mainDarkColor,
                          inputBoxShadow: const BoxShadow(
                            color: shadowColor,
                            offset: Offset(15, 20),
                            blurRadius: 45,
                            spreadRadius: 0.1,
                          ),
                          isEnable: true,
                          isPrefix: true,
                          prefixIcon: Icons.person,
                          prefixIconColor: mainDarkColor,
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        TextFieldWidget(
                          textController: controller.emailController,
                          invalid: controller.emailValid,
                          validator: (v) {
                            return controller.validateEmail(v!);
                          },
                          onSaved: (v) {
                            controller.email = v!;
                          },
                          width: Get.width,
                          height: 57.0,
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
                          isPrefix: true,
                          prefixIcon: Icons.email,
                          prefixIconColor: mainDarkColor,
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        TextFieldWidget(
                          textController: controller.passwordController,
                          invalid: controller.passwordValid,
                          isObscureText: true,
                          validator: (v) {
                            return controller.validatePassword(v!);
                          },
                          onSaved: (v) {
                            controller.password = v!;
                          },
                          width: Get.width,
                          height: 57.0,
                          bgColor: bgWhiteColor,
                          hint: PASSWORD,
                          hintTextStytle: inputHintTextStyle,
                          borderColor: mainDarkColor,
                          inputBoxShadow: const BoxShadow(
                            color: shadowColor,
                            offset: Offset(15, 20),
                            blurRadius: 45,
                            spreadRadius: 0.1,
                          ),
                          isEnable: true,
                          isPrefix: true,
                          prefixIcon: Icons.lock,
                          prefixIconColor: mainDarkColor,
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        TextFieldWidget(
                          textController: controller.cPasswordController,
                          invalid: controller.passwordValid,
                          isObscureText: true,
                          validator: (v) {
                            return controller.validatePassword(v!);
                          },
                          onSaved: (v) {
                            controller.cPassword = v!;
                          },
                          width: Get.width,
                          height: 57.0,
                          bgColor: bgWhiteColor,
                          hint: C_PASSWORD,
                          hintTextStytle: inputHintTextStyle,
                          borderColor: mainDarkColor,
                          inputBoxShadow: const BoxShadow(
                            color: shadowColor,
                            offset: Offset(15, 20),
                            blurRadius: 45,
                            spreadRadius: 0.1,
                          ),
                          isEnable: true,
                          isPrefix: true,
                          prefixIcon: Icons.lock,
                          prefixIconColor: mainDarkColor,
                        ),
                        SizedBox(
                          height: 4.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RoundCheckBox(
                              size: 22,
                              checkedColor: mainLightColor,
                              borderColor: mainLightColor,
                              onTap: (selected) {},
                            ),
                            SizedBox(
                              width: 2.0.w,
                            ),
                            Text(
                              KEEP_ME,
                              style: TextStyle(
                                color: textBlackColor,
                                fontSize: normalXSize,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RoundCheckBox(
                              size: 22,
                              checkedColor: mainLightColor,
                              borderColor: mainLightColor,
                              onTap: (selected) {},
                            ),
                            SizedBox(
                              width: 2.0.w,
                            ),
                            Text(
                              EMAIL_ME,
                              style: TextStyle(
                                color: textBlackColor,
                                fontSize: normalXSize,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.0.h,
                        ),
                        ButtonGradientWidget(
                          toUpperCase: true,
                          text: SIGN_UP,
                          onPressed: () {
                            controller.doRegister();
                          },
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              ALREADY_ACC,
                              style: TextStyle(
                                color: Color(0xFF000000),
                              ),
                            ),
                            SizedBox(
                              width: 2.0.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(LoginPage());
                              },
                              child: const Text(
                                LOGIN,
                                style: TextStyle(
                                    color: mainDarkColor,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
}

class _Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }
}
