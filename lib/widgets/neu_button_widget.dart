import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../values/colors.dart';
import '../values/images.dart';

class NeuButtonWidget extends StatelessWidget {
  final Color? bgButton;
  final Color? shadowRB;
  final Color? shadowLT;
  final Color? blurColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? radius;
  final double? spreadRadius;
  final double? blurRadius;
  final Widget? child;
  final Function()? onPressed;
  final BoxShadow? boxShadow;
  final bool? isBorder;
  final bool? isBoxShadow;
  // ignore: unused_field
  final bool _isElevated = false;
  // ignore: unused_field
  final bool _isDark = false;

  const NeuButtonWidget({
    Key? key,
    this.bgButton,
    this.width,
    this.height,
    this.radius,
    this.spreadRadius,
    this.child,
    this.onPressed,
    this.shadowRB,
    this.shadowLT,
    this.blurRadius,
    this.boxShadow,
    this.blurColor,
    this.isBorder,
    this.isBoxShadow,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        width: width ?? 45,
        height: height ?? 45,
        decoration: BoxDecoration(
          color: bgButton ?? greyLightColor,
          border: isBorder == true
              ? Border.all(
                  color: borderColor ?? greyDarkColor,
                  width: 1,
                )
              : null,
          borderRadius: BorderRadius.circular(radius ?? 15),
          boxShadow: isBoxShadow == true
              ? [
                  const BoxShadow(
                    color: Color(0xFFBEBEBE),
                    // Shadow for bottom right corner
                    offset: Offset(10, 10),
                    blurRadius: 30,
                    spreadRadius: 1,
                  ),
                ]
              : [
                  const BoxShadow(
                    color: Color(0xFFBEBEBE),
                    // Shadow for bottom right corner
                    offset: Offset(10, 10),
                    blurRadius: 30,
                    spreadRadius: 1,
                  ),
                ],
        ),
        duration: const Duration(
          milliseconds: 200,
        ),
        child: child,
      ),
    );
  }
}
