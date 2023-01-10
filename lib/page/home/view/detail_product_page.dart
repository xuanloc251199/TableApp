import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../values/colors.dart';
import '../../../values/images.dart';
import '../../../widgets/button_gradient_widget.dart';
import '../../../widgets/neu_button_widget.dart';
import '../controller/detail_product_controller.dart';
import '../controller/product_controller.dart';
import '../controller/shop_controller.dart';
import '../model/product.dart';
import '../model/shop.dart';

class DetailProductPage extends GetView<DetailProductController> {
  final Product? product;
  final Shop? shop;

  const DetailProductPage({this.product, this.shop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GetBuilder<DetailProductController>(
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
      ),
    );
  }

  Widget _buildBody() {
    final ProductController productController = Get.put(ProductController());
    final ShopController shopController = Get.put(ShopController());
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 70.0.h,
        maxHeight: 95.0.h,
        body: Container(
          child: Image.asset(
            bg_profile,
            fit: BoxFit.fill,
          ),
        ),
        panelBuilder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                            color: Colors.orange.withOpacity(0.5)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 76.0,
                        height: 34.0,
                        decoration: BoxDecoration(
                            color: mainDarkColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Popular",
                            style: TextStyle(
                                color: mainDarkColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.0.h,
                      ),
                      Row(
                        children: [
                          ButtonGradientWidget(
                            width: 34,
                            height: 34,
                            borderRadius: 20,
                            padding: EdgeInsets.all(5),
                            linearGradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                greenWhiteLightColor,
                                greenWhiteLightColor
                              ],
                            ),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: mainDarkColor,
                            ),
                          ),
                          SizedBox(
                            width: 2.0.w,
                          ),
                          ButtonGradientWidget(
                            width: 34,
                            height: 34,
                            borderRadius: 20,
                            padding: EdgeInsets.all(5),
                            linearGradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                greenWhiteLightColor,
                                greenWhiteLightColor
                              ],
                            ),
                            child: Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Text(
                    shop!.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: mainDarkColor,
                      ),
                      Text("19 Km"),
                      SizedBox(
                        width: 2.0.w,
                      ),
                      Icon(
                        Icons.star_half_outlined,
                        color: mainDarkColor,
                      ),
                      Text("4.8 Rating"),
                    ],
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  SizedBox(
                    height: 120,
                    child: Text(
                      shop!.address,
                      maxLines: 6,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Menu",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(color: Colors.orange.withOpacity(0.5)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  SizedBox(
                    height: 185,
                    child: Obx(() {
                      if (shopController.isLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          itemCount: product!.id.isEqual(shop!.id)
                              ? productController.productList.length
                              : 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => NeuButtonWidget(
                            width: 147,
                            height: 171,
                            child: product!.id.isEqual(shop!.id)
                                ? Column(
                                    children: [
                                      Image.asset(imgUrlBase + product!.image),
                                      SizedBox(
                                        height: 2.0.h,
                                      ),
                                      Text(
                                        product!.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 2.0.h,
                                      ),
                                      Text(product!.price.toString() + "\$")
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Image.asset(
                                          "assets/images/image_product.png"),
                                      SizedBox(
                                        height: 2.0.h,
                                      ),
                                      Text(
                                        "Spacy fresh crab",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 2.0.h,
                                      ),
                                      Text("18 \$")
                                    ],
                                  ),
                          ),
                        );
                      }
                    }),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Text("Testimonials",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  Column(
                    children: [
                      ...List.generate(
                        3,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0.h),
                          child: NeuButtonWidget(
                            height: 128,
                            width: Get.width,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                      "assets/images/Photo Profile.png"),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Dianne Russell",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                "12 April 2021",
                                                style: TextStyle(
                                                    color: Colors.grey
                                                        .withOpacity(0.5)),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                            height: 33,
                                            width: 53,
                                            decoration: BoxDecoration(
                                                color: mainDarkColor
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: mainDarkColor,
                                                  ),
                                                  Text("5",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                          color: mainDarkColor))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "This is great. So delicious! You Must Here. With Your family product helllo how are you iam fine thanks",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
    );
  }
}
