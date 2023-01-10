import 'package:face_auth_flutter/page/main/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../values/colors.dart';
import '../../../values/dimen.dart';
import '../../../values/fonts.dart';
import '../../../values/images.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';
import '../../../widgets/neu_button_widget.dart';
import '../controller/booking_table_controller.dart';
import 'dropdow_button.dart';

class BookingTablePage extends GetView<BookingTableController> {
  const BookingTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingTableController>(
      builder: (value) => AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(context),
          )),
    );
  }

  Widget _buildBody(BuildContext context) {
    const List<String> list = <String>[
      'Floor 1',
      'Floor 2',
      'Floor 3',
      'Floor 4'
    ];

    String dropdownValue = list.first;
    return Scaffold(
      body: SlidingUpPanel(
        body: Container(
          child: Image.asset(
            bg_booking_table,
            fit: BoxFit.cover,
          ),
        ),
        panelBuilder: (controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: orangeLightColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Row(
                    children: [
                      NeuButtonWidget(
                        width: 111,
                        height: 34,
                        radius: 20,
                        bgButton: goldLightColor,
                        child: Center(
                          child: Text(
                            MEMBER_GOLD,
                            style: TextStyle(
                              color: goldDarkColor,
                              fontFamily: robotoBold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Table for 2 people",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.favorite,
                          color: mainDarkColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Text(
                    DETAIL_TABLE,
                    style: inputHintTextStyle,
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Floor:",
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: mediumXSize,
                              fontFamily: robotoBold,
                            ),
                          ),
                          SizedBox(
                            height: 2.0.h,
                          ),
                          Text(
                            "Time:",
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: mediumXSize,
                              fontFamily: robotoBold,
                            ),
                          ),
                          SizedBox(
                            height: 2.0.h,
                          ),
                          Text(
                            "Day:",
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: mediumXSize,
                              fontFamily: robotoBold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButtonItem(),
                          SizedBox(
                            height: 2.0.h,
                          ),
                          Text(
                            "18:00",
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: mediumXSize,
                              fontFamily: robotoRegular,
                            ),
                          ),
                          SizedBox(
                            height: 2.0.h,
                          ),
                          Text(
                            "14/01/2023",
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: mediumXSize,
                              fontFamily: robotoRegular,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  NeuButtonWidget(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Get.to(MainPage()),
                            child: const Text('Go home'),
                          ),
                        ],
                      ),
                    ),
                    bgButton: mainDarkColor,
                    width: 100.0.w,
                    height: 7.0.h,
                    child: Center(
                      child: Text(
                        "Booking Table",
                        style: TextStyle(
                          color: bgWhiteColor,
                          fontFamily: robotoBold,
                          fontSize: mediumSize,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
    );
  }
}
