// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class Dimensions {
  //932 for iphone 14 Pro Max mobile emulator
  static double screenHeight = Get.height;
  //430
  static double screenWidth = Get.width;

  // dynamic height padding and margin
  // 932/10 = 93.2
  static double height10 = screenHeight / 93.2;
  // 932/15= 62.1
  static double height15 = screenHeight / 62.1;
  static double height20 = screenHeight / 46.6;
  static double height30 = screenHeight / 31.0;
  static double height40 = screenHeight / 23.3;
  static double heigth50 = screenHeight / 18.6;

  //dynamic width padding and margin
  static double width5 = screenHeight / 186.4;
  static double width10 = screenHeight / 93.2;
  static double width15 = screenHeight / 62.1;
  static double width20 = screenHeight / 46.6;
  static double width30 = screenHeight / 31.0;
  static double width40 = screenHeight / 23.3;
  static double width50 = screenHeight / 18.6;

  //font size
  static double font10 = screenHeight / 93.2;
  static double font15 = screenHeight / 62.1;
  static double font20 = screenHeight / 46.6;
  static double font26 = screenHeight / 35.8;

  //radius
  static double radius15 = screenHeight / 62.1;
  static double radius20 = screenHeight / 46.6;
  // 932/30 = 31.06
  static double radius30 = screenHeight / 31.0;

  //icon size
  static double iconSize10 = screenHeight / 93.2;
  static double iconSize24 = screenHeight / 38.8;
  static double iconSize20 = screenHeight / 46.6;
  static double iconSize16 = screenHeight / 58.2;

  //list view size
  // 430/120 = 3.58
  static double listViewImgSize = screenWidth / 3.5;
  static double listViewTextContSize = screenWidth / 4.3;

  // 932/350 =2.66
  static double popularFoodImgSize = screenHeight / 2.6;

  //bottom height
  // 932/160 = 5.82
  static double bottomHeightBar = screenHeight / 5.8;

  //text_field widget size
  // 430/350 = 1.22
  // 932/60 = 15.53
  static double text_field_width = screenWidth / 1.2;
  static double text_field_height = screenHeight / 15.5;

  //splash screen dimensions
  static double splashImg = screenHeight / 3.7;

  // static double text_field_height = screenHeight / 15.5;
  static double text_field_height50 = screenHeight / 18.6;
}
