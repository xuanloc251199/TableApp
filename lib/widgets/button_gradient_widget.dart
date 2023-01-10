import 'package:flutter/material.dart';

import '../values/colors.dart';

class ButtonGradientWidget extends StatelessWidget {
  final String? text;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final String? font;
  final Color? colorText;
  final double? size;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final Border? border;
  final bool? toUpperCase;
  final LinearGradient? linearGradient;
  final Color? backgroundColor;
  final Widget? child;

  ButtonGradientWidget({
    this.text,
    this.margin,
    this.padding,
    this.borderRadius,
    this.font,
    this.colorText,
    this.size,
    this.onPressed,
    this.width,
    this.height,
    this.border,
    this.toUpperCase,
    this.linearGradient,
    this.backgroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    double luminance =
        backgroundColor != null ? backgroundColor!.computeLuminance() : 0;
    return InkWell(
      onTap: () => onPressed != null ? onPressed!() : null,
      borderRadius: borderRadius != null
          ? BorderRadius.circular(borderRadius!)
          : BorderRadius.circular(15),
      child: Container(
        padding: padding ?? EdgeInsets.all(16),
        width: width ?? 157,
        height: height ?? 57,
        margin: margin,
        decoration: BoxDecoration(
            color: backgroundColor ?? null,
            gradient: linearGradient ??
                LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [mainLightColor, mainDarkColor],
                ),
            border: border ?? null,
            borderRadius: borderRadius != null
                ? BorderRadius.circular(borderRadius!)
                : BorderRadius.circular(15)),
        child: child ??
            Center(
              child: Text(
                toUpperCase == null ? text!.toLowerCase() : text!,
                style: TextStyle(
                  fontSize: size,
                  fontFamily: font,
                  color: colorText != null
                      ? colorText
                      : luminance > 0.5
                          ? textBlackColor
                          : textWhiteColor,
                ),
              ),
            ),
      ),
    );
  }
}
