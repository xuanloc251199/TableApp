import 'package:face_auth_flutter/page/home/view/booking_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../values/colors.dart';
import '../../../values/dimen.dart';
import '../../../values/fonts.dart';
import '../../../values/images.dart';
import '../../../values/styles.dart';
import '../../../widgets/neu_button_widget.dart';
import '../model/shop.dart';

class ShopItem extends StatelessWidget {
  final Shop shop;

  const ShopItem({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24),
      child: NeuButtonWidget(
        width: 40.0.w,
        radius: 22,
        onPressed: () {
          Get.to(BookingTablePage()); //vào value -> image
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgUrlBase + shop.avt,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 2.0.w),
            Text(
              shop.name,
              style: TextStyle(
                color: textBlackColor,
                fontFamily: robotoRegular,
                fontSize: mediumXSize,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 1.5.w,
            ),
            Text(
              shop.address,
              style: inputHintTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
