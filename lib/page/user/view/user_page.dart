import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../utils/local_db.dart';
import '../../../values/colors.dart';
import '../../../values/dimen.dart';
import '../../../values/fonts.dart';
import '../../../values/images.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';
import '../../../widgets/button_gradient_widget.dart';
import '../../../widgets/neu_button_widget.dart';
import '../../home/model/menu_emblem.dart';
import '../controller/user_controller.dart';

class UserPage extends GetView<UserController> {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (value) => AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(),
          )),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      body: SlidingUpPanel(
        body: Container(
          child: Image.asset(
            bg_profile,
            fit: BoxFit.fill,
          ),
        ),
        panelBuilder: (controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: orangeLightColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Row(
                    children: [
                      NeuButtonWidget(
                        width: 111,
                        height: 34,
                        radius: 20,
                        bgButton: goldLightColor,
                        child: Center(
                          child: Text(
                            MEMBER_GOLD,
                            style: TextStyle(
                              color: goldDarkColor,
                              fontFamily: robotoBold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Lê Thi Minh Châu",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 2.0.w),
                          Text(
                            "${LocalDB.getUser().name}",
                            style: inputHintTextStyle,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.edit,
                        color: mainDarkColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  NeuButtonWidget(
                    width: 347,
                    height: 64,
                    isBoxShadow: true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          Image.asset("assets/images/Voucher Icon.png"),
                          SizedBox(
                            width: 8.0.w,
                          ),
                          Text(
                            "You Have 3 Voucher",
                            style: TextStyle(
                              fontFamily: robotoRegular,
                              fontSize: medium15Size,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Text(
                    "Favorite",
                    style: TextStyle(
                      fontFamily: robotoBold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      itemCount: menuItem.length,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, i) => Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: NeuButtonWidget(
                          isBoxShadow: true,
                          width: Get.width,
                          height: 120,
                          radius: 22,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.0.w,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(
                                        menuItem[i].imgMenu,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.0.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          menuItem[i].nameMenu,
                                          style: TextStyle(
                                            color: textBlackColor,
                                            fontFamily: robotoRegular,
                                            fontSize: normalSize,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 1.5.w,
                                        ),
                                        Text(
                                          menuItem[i].nameRes,
                                          style: TextStyle(
                                            color: textGreyColor,
                                            fontFamily: robotoRegular,
                                            fontSize: smallMediumSize,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 1.5.w,
                                        ),
                                        Text(
                                          menuItem[i].price,
                                          style: TextStyle(
                                            color: mainLightColor,
                                            fontFamily: robotoRegular,
                                            fontSize: largeSize,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                ButtonGradientWidget(
                                  width: 20.0.w,
                                  height: 30,
                                  padding: EdgeInsets.all(3),
                                  text: BUY_AGAIN,
                                  size: verySmallSize,
                                  colorText: textWhiteColor,
                                  toUpperCase: true,
                                  onPressed: () {
                                    // Get.to(Payments());
                                  },
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
            ),
          );
        },
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
    );
  }
}
