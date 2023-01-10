// import '../../Pages/components/default_button.dart';
// import '../../Pages/components/text_input_field.dart';
// import '../../Pages/signup/payment_method.dart';
// import '../../size_config.dart';
// import '../../ui/auth/sign_up/controller/sign_up_process_controller.dart';
// import '../../values/colors.dart';
// import '../../values/images.dart';
// import '../../widget/neu_button_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class SignUpPage extends GetView<SignUpProcessController> {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: GetBuilder<SignUpProcessController>(
//         builder: (value) => AnnotatedRegion(
//           child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             body: _buildBody(),
//           ),
//           value: SystemUiOverlayStyle(
//             statusBarColor: Colors.transparent,
//             statusBarIconBrightness: Brightness.dark,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildBody() {
//     return Positioned(
//       top: 0.0,
//       child: Container(
//         padding:
//             EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: getProportionateScreenHeight(38),
//             ),
//             Container(
//               width: getProportionateScreenWidth(45),
//               height: getProportionateScreenHeight(45),
//               decoration: BoxDecoration(
//                   color: const Color(0xFFF9A84D),
//                   borderRadius: BorderRadius.circular(15)),
//               child: NeuButtonWidget(
//                 width: 50,
//                 height: 50,
//                 bgButton: orangeLightColor,
//                 child: Center(
//                   child: Container(
//                     width: 20,
//                     height: 20,
//                     child: Image.asset(
//                       ic_back,
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   Get.back();
//                 },
//               ),
//             ),
//             SizedBox(
//               height: getProportionateScreenHeight(20),
//             ),
//             Text(
//               "Fill in your bio to get \nstarted",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: getProportionateScreenWidth(25)),
//             ),
//             SizedBox(
//               height: getProportionateScreenHeight(19),
//             ),
//             Text(
//               "This data will be displayed in your account\nprofile for security",
//               style: TextStyle(fontSize: getProportionateScreenWidth(12)),
//             ),
//             SizedBox(
//               height: getProportionateScreenHeight(20),
//             ),
//             SizedBox(
//               height: getProportionateScreenHeight(61),
//               width: getProportionateScreenWidth(330),
//               child: const TextInputField(
//                 hintText: "First Name",
//               ),
//             ),
//             SizedBox(
//               height: getProportionateScreenHeight(20),
//             ),
//             SizedBox(
//               height: getProportionateScreenHeight(61),
//               width: getProportionateScreenWidth(330),
//               child: const TextInputField(
//                 hintText: "Last Name",
//               ),
//             ),
//             SizedBox(
//               height: getProportionateScreenHeight(20),
//             ),
//             SizedBox(
//               height: getProportionateScreenHeight(61),
//               width: getProportionateScreenWidth(330),
//               child: const TextInputField(
//                 hintText: "Mobile Number",
//               ),
//             ),
//             SizedBox(
//               height: getProportionateScreenHeight(220),
//             ),
//             SizedBox(
//               width: SizeConfig.screenWidth - 20,
//               child: Center(
//                 child: DefaultButton(
//                   text: "Next",
//                   press: () {
//                     Get.to(PaymentMethod());
//                   },
//                   height: getProportionateScreenHeight(57),
//                   width: getProportionateScreenWidth(157),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
