import 'package:flutter/material.dart';

import '../keys/app_assets.dart';
import 'app_colors.dart';
import 'size_config.dart';

class AppStyles {
  AppStyles._();

  static final headingStyle = TextStyle(
    fontSize: SizeConfig.getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5,
  );
  static const loginBackGround = BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AppAssets.loginBackground),
      fit: BoxFit.cover,
    ),
  );
  static final loginButton = ButtonStyle(
    elevation: const WidgetStatePropertyAll<double>(10),
    fixedSize: WidgetStatePropertyAll(Size(SizeConfig.percentWidth(0.9), 50)),
    backgroundColor: const WidgetStatePropertyAll(AppColors.color4),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
