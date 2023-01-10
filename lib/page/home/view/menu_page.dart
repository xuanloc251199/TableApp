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
import '../../../widgets/text_field_widget.dart';
import '../controller/home_controller.dart';
import '../model/menu_emblem.dart';
import 'notification_page.dart';
import 'search_page.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 5.0.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0.w,
                      vertical: 3.0.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TITLE_HOME_PAGE,
                          style: TextStyle(
                            fontFamily: robotoRegular,
                            fontSize: largeMediumSize,
                            height: normalLineSpacing,
                          ),
                        ),
                        NeuButtonWidget(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: Icon(
                              Icons.notifications_none,
                              size: 30,
                              color: mainDarkColor,
                            ),
                          ),
                          onPressed: () {
                            Get.to(NotificationPage());
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(
                      horizontal: 8.0.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldWidget(
                          isEnable: false,
                          width: 66.0.w,
                          height: 50,
                          prefixIcon: Icons.search,
                          prefixIconColor: orangeDarkColor,
                          hint: HINT_SEARCH_TEXT,
                          radius: 15,
                        ),
                        NeuButtonWidget(
                          width: 50,
                          height: 50,
                          bgButton: orangeLightColor,
                          child: Center(
                            child: Container(
                              width: 20,
                              height: 20,
                              child: Image.asset(
                                ic_review,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.to(SearchPage());
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.0.w,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0.w),
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              POPULAR_MENU,
                              style: TextStyle(
                                color: textBlackColor,
                                fontFamily: robotoRegular,
                                fontSize: normalXSize,
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
                            itemCount: menuItem.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, i) => Container(
                              margin: EdgeInsets.only(bottom: 24),
                              child: NeuButtonWidget(
                                width: Get.width,
                                height: 87,
                                radius: 22,
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        menuItem[i].price,
                                        style: TextStyle(
                                          color: textOrangeColor,
                                          fontFamily: robotoRegular,
                                          fontSize: largeSize,
                                        ),
                                        textAlign: TextAlign.center,
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
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
