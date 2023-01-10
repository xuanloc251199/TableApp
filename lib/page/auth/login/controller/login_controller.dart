import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../../network_service/auth_services.dart';
import '../../../../utils/local_db.dart';
import '../../../../values/strings.dart';
import '../../../face_recognition/camera_page.dart';
import '../../../main/view/main_page.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  String KEY_NAME = "name";

  bool emailValid = false;
  bool passwordValid = false;
  final loginFormKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();
  String error = "";

  String email = ' ';
  String password = ' ';

  var loginProcess = false.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      emailValid == false;
      return error = ERROR_EMAIL;
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length <= 5) {
      passwordValid == false;
      return error = ERROR_PASSWORD;
    } else {
      return null;
    }
  }

  doLogin() async {
    bool isValidate = loginFormKey.currentState!.validate();

    if (isValidate) {
      isLoading(true);
      try {
        assert(EmailValidator.validate(emailController.text));

        var data = await AuthServices.login(
          email: emailController.text,
          password: passwordController.text,
        );

        if (data != null) {
          await storage.write(key: "name", value: data.user.name);
          await storage.write(key: "token", value: data.token);
          loginFormKey.currentState!.save();
          Get.to(MainPage());
        } else {
          Get.snackbar(LOGIN, ERROR_LOGIN);
        }
      } finally {
        isLoading(false);
      }
    }
  }

  doAuthFaceId() async {
    // final authenticate = await LocalAuth.authenticate();
    Get.to(FaceScanScreen(
      user: LocalDB.getUser(),
    ));
  }

  doAuthTouchId() async {
    // Get.to(const FaceScanScreen());
  }
}

//======================================================================//

// Future<String> login(
  //     {required String email, required String password}) async {
  //   error = "";
  //   try {
  //     loginProcess(true);
  //     List loginResp =
  //         await AuthServices.login(email: email, password: password);
  //     if (loginResp[0] != "") {
  //       //success
  //       final prefs = await SharedPreferences.getInstance();
  //       prefs.setString("token", loginResp[0]);
  //       Get.to(MainPage());
  //     } else {
  //       error = loginResp[1];
  //     }
  //   } finally {
  //     loginProcess(false);
  //   }
  //   return error;
  // }

  // Future<bool> refresh() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString("token");

  //   if (token == null) {
  //     return false;
  //   }

  //   bool success = false;
  //   try {
  //     loginProcess(true);
  //     List loginResp = await AuthServices.refreshToken(token: token);
  //     if (loginResp[0] != "") {
  //       //success
  //       final prefs = await SharedPreferences.getInstance();
  //       prefs.setString("token", loginResp[0]);
  //       success = true;
  //     }
  //   } finally {
  //     loginProcess(false);
  //   }
  //   return success;
  // }

  // Future<void> onCheckLogin() async {
  //   if (!email.text.isNotEmpty) {
  //     phoneNumberValid = true;
  //     error = ERROR_LOGIN;
  //     Get.snackbar(LOGIN, ERROR_LOGIN);
  //   } else
  //     phoneNumberValid = false;

  //   if (!password.text.isNotEmpty) {
  //     passwordValid = true;
  //     Get.snackbar(LOGIN, ERROR_LOGIN);
  //   } else
  //     passwordValid = false;

  //   if (passwordValid == false && phoneNumberValid == false) {
  //     // login(email: email.text, password: password.text);
  //     // if (loginFormKey.currentState!.validate()) {
  //     //   String error = await login(email: email.text, password: password.text);
  //     //   if (error != "") {
  //     //     Get.defaultDialog(title: "Oop!", middleText: error);
  //     //   } else {
  //     //     Get.to(MainPage());
  //     //   }
  //     // }
  //   } else {
  //     passwordValid = true;
  //     Get.snackbar(LOGIN, "faile");
  //   }
  //   update();
  // }
