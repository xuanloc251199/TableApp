import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../values/colors.dart';
import '../../../values/dimen.dart';
import '../../../values/fonts.dart';
import '../../../values/images.dart';
import '../../../values/strings.dart';
import '../../../widgets/neu_button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../controller/view_more_controller.dart';
import '../model/restaurant_emblem.dart';

class ViewMorePage extends GetView<ViewMoreController> {
  const ViewMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GetBuilder<ViewMoreController>(
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
                            POPULAR_RESTAURANT,
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
                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          children: [
                            for (var i = 0; i < restaurantItem.length; i++)
                              NeuButtonWidget(
                                width: 147,
                                height: 184,
                                radius: 22,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(restaurantItem[i].imgRes),
                                    SizedBox(height: 2.0.w),
                                    Text(
                                      restaurantItem[i].nameRes,
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
                                      restaurantItem[i].time,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
