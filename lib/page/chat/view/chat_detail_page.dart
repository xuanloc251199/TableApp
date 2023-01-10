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
import '../../call/view/call_page.dart';
import '../../home/controller/home_controller.dart';
import '../controller/chat_detail_controller.dart';
import '../model/message_emblem.dart';
import '../model/user_emblem.dart';

class ChatDetailPage extends GetView<ChatDetailController> {
  final User user;
  const ChatDetailPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (value) => AnnotatedRegion(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: _buildBody(),
        ),
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
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
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 3.0.w,
              ),
              padding: EdgeInsets.only(bottom: 3.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
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
                  Row(
                    children: [
                      Text(
                        CHAT,
                        style: TextStyle(
                          fontFamily: robotoRegular,
                          fontSize: largeXLSize,
                          height: normalLineSpacing,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.0.w,
                  ),
                  NeuButtonWidget(
                    width: Get.width,
                    height: 87,
                    radius: 22,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 62,
                                height: 62,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  user.avatar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 3.0.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    user.name,
                                    style: TextStyle(
                                      color: textBlackColor,
                                      fontFamily: robotoBold,
                                      fontSize: medium15Size,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 1.5.w,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        margin: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              mainLightColor,
                                              mainDarkColor
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        STATUS,
                                        style: TextStyle(
                                          color: textGreyColor,
                                          fontFamily: robotoRegular,
                                          fontSize: smallSize,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ButtonGradientWidget(
                            width: 40,
                            height: 40,
                            borderRadius: 20,
                            padding: EdgeInsets.all(5),
                            onPressed: () {
                              Get.to(CallPage(user: user));
                            },
                            linearGradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                greenWhiteLightColor,
                                greenWhiteDarkColor
                              ],
                            ),
                            child: Image.asset(
                              ic_call,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.0.w,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 5.0.w,
                      bottom: 10.0.w,
                    ),
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      itemCount: messages.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        bool isMe = message.sender.id == currentUser.id;
                        return Container(
                          margin: EdgeInsets.only(bottom: 24),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: isMe
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ButtonGradientWidget(
                                    borderRadius: 13,
                                    linearGradient: !isMe
                                        ? LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              greyLightColor,
                                              greyDarkColor,
                                            ],
                                          )
                                        : null,
                                    child: Text(
                                      messages[index].text,
                                      style: TextStyle(
                                        color: isMe
                                            ? textWhiteColor
                                            : textBlackColor,
                                        fontFamily: robotoRegular,
                                        fontSize: normalXSize,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          width: Get.width,
          child: Container(
            padding: EdgeInsets.all(3.0.w),
            child: TextFieldWidget(
              isEnable: true,
              width: Get.width,
              height: 50,
              bgColor: greyLightColor,
              isSuffix: true,
              suffixIcon: Icons.send_rounded,
              suffixIconColor: mainDarkColor,
              radius: 15,
            ),
          ),
        )
      ],
    );
  }
}
