import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = MediaQuery.of(Get.context!).size.height;
  static double screenWidth = MediaQuery.of(Get.context!).size.width;

  //x=843.45/300 and y=843/150;
  static double pageViewContainer = screenHeight / 2.81;
  static double pageViewTextContainer = screenHeight / 5.60;

  static double height10 = screenHeight / 84.3;
  static double height15 = screenHeight / 56.00;
  static double height20 = screenHeight / 28.81;

  static double width10 = screenWidth / 84.3;
  static double width20 = screenHeight / 41.15;
  static double width40 = screenHeight / 21.075;

  static double font20 = screenHeight / 42.22;
  static double font30 = screenHeight/28.1;

  static double radius40 = screenHeight / 21.075;
  static double radius30 = screenHeight / 28.81;

  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  static double coverdisp = screenHeight/3.7;


}
