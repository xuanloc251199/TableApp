import 'package:face_auth_flutter/page/auth/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../../local_models/user.dart';
import '../../../../network_service/auth_services.dart';
import '../../../../values/strings.dart';
import '../../../face_recognition/ml_service.dart';
import '../../../main/view/main_page.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  final registerFormkey = GlobalKey<FormState>();

  late final User? local_user;
  final MLService _mlService = MLService();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController cPasswordController;

  String name = ' ';
  String email = ' ';
  String password = ' ';
  String cPassword = ' ';

  bool nameValid = false;
  bool emailValid = false;
  bool passwordValid = false;
  String error = "";

  final storage = FlutterSecureStorage();

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      emailValid == false;
      return ERROR_EMAIL;
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length <= 5) {
      return ERROR_PASSWORD;
    } else {
      return null;
    }
  }

  doRegister() async {
    bool isValidate = registerFormkey.currentState!.validate();

    if (isValidate) {
      isLoading(true);
      try {
        var data = await AuthServices.register(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: cPasswordController.text,
        );

        if (data != null) {
          await storage.write(key: "name", value: data.user.name);
          await storage.write(key: "token", value: data.token);
          registerFormkey.currentState!.save();
          Get.to(LoginPage());
        } else {
          Get.snackbar("Register", "false");
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
