import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../values/colors.dart';
import '../../../values/dimen.dart';
import '../../../values/fonts.dart';
import '../../../values/images.dart';
import '../../../values/strings.dart';
import '../../../widgets/neu_button_widget.dart';
import '../controller/home_controller.dart';
import '../controller/notification_controller.dart';
import '../model/notification_emblem.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GetBuilder<HomeController>(
        builder: (value) => AnnotatedRegion(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: _buildBody(),
            ),
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            )),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            bgHomePage,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8.0.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      NeuButtonWidget(
                        width: 50,
                        height: 50,
                        bgButton: orangeLightColor,
                        child: Center(
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              ic_back,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  Container(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              NOTIFICATION,
                              style: TextStyle(
                                color: textBlackColor,
                                fontFamily: robotoRegular,
                                fontSize: largeXLSize,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.0.w,
                        ),
                        Container(
                          width: Get.width,
                          height: Get.height,
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            itemCount: notificationItem.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, i) => Container(
                              margin: EdgeInsets.only(bottom: 24),
                              child: NeuButtonWidget(
                                width: Get.width,
                                height: 105,
                                radius: 22,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.0.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        padding: EdgeInsets.all(
                                          2.0.w,
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.asset(
                                          notificationItem[i].imgIcon,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.0.w,
                                      ),
                                      Container(
                                        width: 50.0.w,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              notificationItem[i].notification,
                                              style: TextStyle(
                                                color: textBlackColor,
                                                fontFamily: robotoRegular,
                                                fontSize: normalSize,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(
                                              height: 1.5.w,
                                            ),
                                            Text(
                                              notificationItem[i].description,
                                              style: TextStyle(
                                                color: textGreyColor,
                                                fontFamily: robotoRegular,
                                                fontSize: smallMediumSize,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
