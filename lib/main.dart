import 'package:camera/camera.dart';
import 'package:face_auth_flutter/page/face_recognition/camera_page.dart';
import 'package:face_auth_flutter/page/home/controller/booking_table_controller.dart';
import 'package:face_auth_flutter/page/home/controller/rating_controller.dart';
import 'package:face_auth_flutter/page/home/controller/search_controller.dart';
import 'package:face_auth_flutter/page/home/controller/voucher_controller.dart';
import 'package:face_auth_flutter/page/main/view/main_page.dart';
import 'package:face_auth_flutter/page/setting/controller/setting_controller.dart';
import 'package:face_auth_flutter/page/splash/view/splash_page.dart';
import 'package:face_auth_flutter/utils/local_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'page/auth/login/controller/login_controller.dart';
import 'page/auth/sign_up/controller/sign_up_controller.dart';
import 'page/chat/controller/chat_controller.dart';
import 'page/home/controller/detail_product_controller.dart';
import 'page/home/controller/home_controller.dart';
import 'page/home/controller/notification_controller.dart';
import 'page/main/controller/main_controller.dart';
import 'page/splash/controller/splash_controller.dart';
import 'page/user/controller/user_controller.dart';
import 'values/colors.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Hive.initFlutter();
  await HiveBoxes.initialize();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(_buildApp());
}

Widget _buildApp() => LayoutBuilder(builder: (context, constraints) {
      return ResponsiveSizer(builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: bgWhiteColor,
            primaryColor: mainDarkColor,
          ),
          home: const SplashPage(),
          initialBinding: _Binding(),
        );
      });
    });

class _Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<ChatController>(() => ChatController(), fenix: true);
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
    Get.lazyPut<RatingController>(() => RatingController(), fenix: true);
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
    Get.lazyPut<DetailProductController>(() => DetailProductController(),
        fenix: true);
    Get.lazyPut<VoucherController>(() => VoucherController(), fenix: true);
    Get.lazyPut<NotificationController>(() => NotificationController(),
        fenix: true);
    Get.lazyPut<SearchController>(() => SearchController(), fenix: true);
    Get.lazyPut<BookingTableController>(() => BookingTableController(),
        fenix: true);
  }
}
