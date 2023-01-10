import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../values/colors.dart';
import '../values/dimen.dart';
import '../values/fonts.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../values/images.dart';

import 'neu_button_widget.dart';

class SpecialButtonWidget extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;
  final Function()? onPressedActivity;
  final String? bgImage;
  final String? title;
  final String? activity;
  final double? width;
  final double? height;
  final Color? textTitleColor;
  final Color? textActivityColor;
  final Color? bgColor;
  final String? image;
  final bool? isBgImage;
  final double? borderRadius;

  const SpecialButtonWidget(
      {Key? key,
      this.child,
      this.onPressed,
      this.bgImage,
      this.title,
      this.activity,
      this.width,
      this.height,
      this.textTitleColor,
      this.textActivityColor,
      this.bgColor,
      this.image,
      this.isBgImage,
      this.borderRadius,
      this.onPressedActivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height ?? 20.0.h,
      margin: EdgeInsets.only(
        bottom: 5.0.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            child: isBgImage == true
                ? Image.asset(
                    bgImage!,
                    fit: BoxFit.fill,
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius ?? 15),
                      color: bgColor ?? orangeDarkColor,
                    ),
                  ),
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 1,
                ),
                Image.asset(
                  image ?? deal,
                  width: 30.0.w,
                ),
                Container(
                  width: 40.0.w,
                  padding: EdgeInsets.only(right: 2.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title!,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: robotoRegular,
                          fontSize: mediumSize,
                          color: textTitleColor ?? textWhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 3.0.w,
                      ),
                      NeuButtonWidget(
                        width: 20.0.w,
                        height: 7.0.w,
                        radius: 5,
                        shadowLT: greyDarkColor,
                        shadowRB: greyDarkColor,
                        onPressed: onPressed,
                        child: Center(
                          child: Text(
                            activity!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: robotoRegular,
                              fontSize: smallMediumSize,
                              color: textActivityColor ?? mainLightColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
