import 'package:flutter/material.dart';

import '../../main.dart';

class SizeConfig {
  static double percentHeight(double percent) {
    return MediaQuery.sizeOf(navKey.currentContext!).height * percent;
  }

  static double percentWidth(double percent) {
    return MediaQuery.sizeOf(navKey.currentContext!).width * percent;
  }

  EdgeInsets percentPadding(double x, double y) => EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(navKey.currentContext!).width * x,
        vertical: MediaQuery.sizeOf(navKey.currentContext!).height * y,
      );

// Get the proportionate height as per screen size
  static double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = MediaQuery.sizeOf(navKey.currentContext!).height;
    // 812 is the layout height that designer use
    return (inputHeight / 812.0) * screenHeight;
  }

// Get the proportionate height as per screen size
  static double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = MediaQuery.sizeOf(navKey.currentContext!).width;
    // 375 is the layout width that designer use
    return (inputWidth / 375.0) * screenWidth;
  }
}
