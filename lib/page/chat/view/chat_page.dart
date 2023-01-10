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
import '../controller/chat_controller.dart';
import '../model/message_emblem.dart';
import 'chat_detail_page.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GetBuilder<ChatController>(
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
              margin: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0.w,
                      vertical: 5.0.h,
                    ),
                    child: Row(children: [
                      Text(
                        CHAT,
                        style: TextStyle(
                          fontFamily: robotoRegular,
                          fontSize: largeXLSize,
                          height: normalLineSpacing,
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    width: Get.width,
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      itemCount: allChats.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: NeuButtonWidget(
                          width: Get.width,
                          height: 87,
                          radius: 22,
                          onPressed: () {
                            Get.to(
                                ChatDetailPage(user: allChats[index].sender));
                          },
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(
                                        allChats[index].avatar,
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
                                          allChats[index].sender.name,
                                          style: TextStyle(
                                            color: textBlackColor,
                                            fontFamily: robotoRegular,
                                            fontSize: medium15Size,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 1.5.w,
                                        ),
                                        Text(
                                          allChats[index].text,
                                          style: TextStyle(
                                            color: textGreyColor,
                                            fontFamily: robotoRegular,
                                            fontSize: normalXSize,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  allChats[index].time,
                                  style: TextStyle(
                                    color: textGreyColor,
                                    fontFamily: robotoRegular,
                                    fontSize: normalXSize,
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
          ),
        ),
      ],
    );
  }
}
