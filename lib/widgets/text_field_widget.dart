import 'package:flutter/material.dart';
import '../values/colors.dart';
import '../values/styles.dart';

class TextFieldWidget extends StatefulWidget {
  final String? title;
  final String? hint;
  final double? widthBorder;
  final TextEditingController? textController;
  final TextInputAction? textAction;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final double? radius;
  final Color? borderColor;
  final Color? borderEnableColor;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final double width;
  final double height;
  final Color? bgColor;
  final BorderSide? enableBorder;
  final TextStyle? hintTextStytle;
  final TextStyle? inputTextStytle;
  final BoxShadow? inputBoxShadow;
  final bool isEnable;
  final bool? isPrefix;
  final bool? isSuffix;
  final bool? isBoxShadow;
  final bool? invalid;
  final bool? isObscureText;

  const TextFieldWidget({
    Key? key,
    this.title,
    this.hint,
    this.widthBorder,
    this.textController,
    this.textAction,
    this.prefixIcon,
    this.focusNode,
    this.textInputType,
    this.radius,
    this.borderColor,
    this.prefixIconColor,
    required this.width,
    required this.height,
    this.bgColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.borderEnableColor,
    this.enableBorder,
    this.hintTextStytle,
    this.inputTextStytle,
    this.inputBoxShadow,
    required this.isEnable,
    this.isPrefix,
    this.isSuffix,
    this.isBoxShadow,
    this.onSaved,
    this.validator,
    this.invalid,
    this.isObscureText,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextFieldWidgetState();
  }
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  Widget build(BuildContext context) => Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.bgColor ?? orangeLightColor,
          borderRadius: BorderRadius.circular(widget.radius ?? 15),
          boxShadow:
              widget.isBoxShadow == true ? [widget.inputBoxShadow!] : null,
        ),
        child: Center(
          child: TextField(
            obscureText:
                widget.isObscureText == true ? widget.isObscureText! : false,
            style: inputTextStyle,
            controller: widget.textController,
            keyboardType: widget.textInputType,
            maxLines: 1,
            focusNode: widget.focusNode,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                hintMaxLines: 1,
                hintText: widget.hint,
                hintStyle: widget.hintTextStytle ?? inputHintTextStyle,
                prefixIcon: widget.isPrefix == true
                    ? Icon(
                        widget.prefixIcon,
                        color: widget.prefixIconColor ?? null,
                      )
                    : null,
                suffixIcon: widget.isSuffix == true
                    ? Icon(
                        widget.suffixIcon,
                        color: widget.suffixIconColor ?? null,
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 15),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? orangeDarkColor,
                    width: widget.widthBorder ?? 0.5,
                  ),
                ),
                enabledBorder: widget.isEnable == true
                    ? OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.radius ?? 15),
                        borderSide: BorderSide(
                          color: widget.borderEnableColor ?? greyDarkColor,
                          width: widget.widthBorder ?? 0.5,
                        ),
                      )
                    : null,
                border: InputBorder.none),
          ),
        ),
      );
}
