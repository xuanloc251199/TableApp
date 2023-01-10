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
import '../../../widgets/special_button_widget.dart';
import '../controller/voucher_controller.dart';
import '../model/voucher_emblem.dart';

class VoucherPage extends GetView<VoucherController> {
  const VoucherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<VoucherController>(
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
                      ),
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
                              VOUCHER_TITLE,
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
                            itemCount: voucherItem.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, i) => Container(
                              child: SpecialButtonWidget(
                                width: Get.width,
                                height: 122,
                                bgImage: voucherItem[i].imgBg,
                                title: voucherItem[i].title,
                                activity: voucherItem[i].activity,
                                textTitleColor: voucherItem[i].titleColor,
                                textActivityColor: voucherItem[i].activityColor,
                                onPressed: () {},
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
