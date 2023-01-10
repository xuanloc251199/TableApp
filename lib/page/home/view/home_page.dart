import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../values/colors.dart';
import '../../../values/dimen.dart';
import '../../../values/fonts.dart';
import '../../../values/images.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';
import '../../../widgets/neu_button_widget.dart';
import '../../../widgets/special_button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../controller/home_controller.dart';
import '../controller/product_controller.dart';
import '../controller/shop_controller.dart';
import 'menu_page.dart';
import 'notification_page.dart';
import 'product_item.dart';
import 'search_page.dart';
import 'shop_item.dart';
import 'view_more_page.dart';
import 'voucher_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<HomeController>(
        builder: (value) => AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    final ShopController shopController = Get.put(ShopController());
    final ProductController productController = Get.put(ProductController());
    bool _isElevated = false;
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              logoApp,
                              width: 15.0.w,
                            ),
                            SizedBox(width: 5.0.w),
                            Text(
                              name_app,
                              style: TextStyle(
                                fontFamily: vigaRegular,
                                color: mainDarkColor,
                                fontWeight: FontWeight.w500,
                                fontSize: largeSize,
                              ),
                            ),
                          ],
                        ),
                        NeuButtonWidget(
                          width: 12.0.w,
                          height: 12.0.w,
                          borderColor: mainDarkColor,
                          child: const Center(
                            child: Icon(
                              Icons.notifications_none,
                              size: 30,
                              color: mainDarkColor,
                            ),
                          ),
                          onPressed: () {
                            Get.to(NotificationPage());
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0.w,
                    ),
                    Container(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFieldWidget(
                            isPrefix: true,
                            isEnable: false,
                            width: 66.0.w,
                            height: 12.0.w,
                            prefixIcon: Icons.search,
                            prefixIconColor: orangeDarkColor,
                            hint: HINT_SEARCH_TEXT,
                            hintTextStytle: inputHintTextStyle,
                            radius: 15,
                            inputBoxShadow: const BoxShadow(
                              color: shadowColor,
                              offset: Offset(15, 20),
                              blurRadius: 45,
                              spreadRadius: 0.1,
                            ),
                          ),
                          NeuButtonWidget(
                            width: 12.0.w,
                            height: 12.0.w,
                            bgButton: orangeLightColor,
                            child: Center(
                              child: Container(
                                width: 20,
                                height: 20,
                                child: Image.asset(
                                  ic_review,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Get.to(const SearchPage());
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const VoucherPage());
                      },
                      child: SpecialButtonWidget(
                        isBgImage: false,
                        width: Get.width,
                        height: 20.h,
                        title: TITLE_AD,
                        activity: BUY_NOW,
                        onPressed: () {
                          Get.to(const VoucherPage());
                        },
                      ),
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
                                NEAREST_RES,
                                style: TextStyle(
                                  color: textBlackColor,
                                  fontFamily: robotoRegular,
                                  fontSize: mediumSize,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    ViewMorePage(),
                                  );
                                },
                                child: Text(
                                  VIEW_MORE,
                                  style: TextStyle(
                                    color: textOrangeColor,
                                    fontFamily: robotoRegular,
                                    fontSize: normalXSize,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: Get.width,
                            height: 30.0.h,
                            child: Obx(
                              () {
                                if (shopController.isLoading.value) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    itemCount: shopController.shopList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return ShopItem(
                                        shop: shopController.shopList[index],
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0.w,
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
                                POPULAR_MENU,
                                style: TextStyle(
                                  color: textBlackColor,
                                  fontFamily: robotoRegular,
                                  fontSize: mediumSize,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(MenuPage());
                                },
                                child: Text(
                                  VIEW_MORE,
                                  style: TextStyle(
                                    color: textOrangeColor,
                                    fontFamily: robotoRegular,
                                    fontSize: normalXSize,
                                  ),
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
                            child: Obx(
                              () {
                                if (shopController.isLoading.value) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    itemCount:
                                        productController.productList.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return ProductItem(
                                        product: productController
                                            .productList[index],
                                        shop: shopController.shopList[index],
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
