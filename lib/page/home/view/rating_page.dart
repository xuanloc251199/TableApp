import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../values/colors.dart';
import '../../../values/dimen.dart';
import '../../../values/fonts.dart';
import '../../../values/images.dart';
import '../../../values/strings.dart';
import '../../../widgets/bg_view.dart';
import '../../../widgets/button_gradient_widget.dart';
import '../../../widgets/neu_button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../../call/controller/call_controller.dart';
import '../controller/rating_controller.dart';
import '../controller/shop_controller.dart';
import '../model/shop.dart';

class RattingPage extends GetView<RatingController> {
  final Shop shop;

  const RattingPage({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShopController shopController = Get.put(ShopController());
    return GestureDetector(
      onTap: () {},
      child: GetBuilder<CallController>(
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
          child: BgView(
            choosed: 2,
          ),
        ),
        Positioned(
          child: Container(
            width: Get.width,
            margin: EdgeInsets.symmetric(horizontal: 3.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8.0.w,
                ),
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.0.w,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: mainLightColor,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage(imgUrlBase + shop.avt),
                  ),
                ),
                SizedBox(
                  height: 8.0.w,
                ),
                Text(
                  THANKS,
                  style: TextStyle(
                    color: textBlackColor,
                    fontFamily: robotoRegular,
                    fontSize: largeXLSize,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                Text(
                  PLS_RATE,
                  style: TextStyle(
                    color: textGreyColor,
                    fontFamily: robotoRegular,
                    fontSize: smallMediumSize,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                Container(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 5; i++)
                        Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Image.asset(ic_star),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          width: Get.width,
          child: Container(
            width: Get.width,
            margin: EdgeInsets.symmetric(
              horizontal: 3.0.w,
            ),
            padding: EdgeInsets.only(bottom: 3.0.w),
            child: Column(
              children: [
                TextFieldWidget(
                  isEnable: true,
                  width: Get.width,
                  height: 50,
                  bgColor: greyLightColor,
                  borderColor: greenWhiteLightColor,
                  prefixIcon: Icons.edit_outlined,
                  prefixIconColor: mainLightColor,
                  hint: HINT_SEARCH_TEXT,
                  hintTextStytle: TextStyle(
                    color: textGreyColor,
                    fontFamily: robotoRegular,
                  ),
                  radius: 15,
                ),
                SizedBox(
                  height: 5.0.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonGradientWidget(
                      width: 65.0.w,
                      text: SUBMIT,
                      colorText: textWhiteColor,
                      toUpperCase: true,
                    ),
                    ButtonGradientWidget(
                      width: 25.0.w,
                      text: SKIP,
                      colorText: mainLightColor,
                      toUpperCase: true,
                      linearGradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [greyLightColor, greyDarkColor],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
