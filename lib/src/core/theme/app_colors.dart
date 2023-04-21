import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color primaryColor = const Color(0xFF7210FF);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color midGreyColor = const Color(0xFF989898);
  static const Color hintTextColor = const Color(0xFFE0E5E9);
  static const Color softBlack = const Color(0xff0F0E0E);
  static const Color errorColor = const Color(0xffE6FF5959);
  static const Color softBlue = const Color(0xffEAE8FE);
  static const Color transparent = Colors.transparent;
  static const Color warningColor = Color(0xffE7C224);

  static const Color lightOrangeColor = Color(0xFFEAA14A);
  static const Color extraLightOrangeColor = Color(0xFFFFF3E5);
  static const Color extremelightOrangeColor = Color(0xFFFFEFE0);
  static const Color errorSnackBarBg = Color(0xE6FF5959);
  static const Color softRedColor = Color(0xFFFFC7C7);

  static const Color blackColor = Color(0xFF2C3038);
  static const Color darkBlurColor = Color(0xFF2C3892);
  static const Color neonColor = Color(0xFF9CDE84);
  static const Color lightBlueColor = Color(0xFF0654BA);
  static const Color lightGreenColor = Color(0xFF58CB5D);
  static const Color softOrangeColor = Color(0xFFFFEFE0);

  static const Color greyColor = Color(0xFF818181);
  static const Color mediumLightGrey = Color(0xFFB8B8B8);
  static const Color lightGrey = Color(0xFFF2F2F2);
  static const Color orangeColor = Color(0xFFF08021);
  static const Color cyanBlueColor = Color(0xFF3870C1);
  static const Color redColor = Color(0xFFFF0000);
  static const Color disabled = Color(0xffF1F1F1);
  static const Color darkGreyColor = Color(0xff656565);
  static const Color shimmerBaseColor = Colors.white;
  static const Color shimmerHighlight = Color(0xFFDDDDDD);
  static const Color shimmerContainerColor = Color(0xFFDDDDDD);
  static const Color inputBorderColor = Color(0xFFFFE8De);
  static const Color errorInputBorderColor = Color(0xFFFF5959);
  static const Color cyanColor = Color(0xFF89D9F2);
  static const Color bidLostColor = Color(0xFFFFBF74);
  static const Color checkBoxColor = Color(0xFF165EBF);
  static const Color iconInactiveColor = Color(0xFF808080);
  static const Color colorViolet = Color(0xFF7100B2);

  static const LinearGradient circleGradient = const LinearGradient(
    begin: FractionalOffset.centerLeft,
    end: FractionalOffset.centerRight,
    // stops: [0, 0.55, 1],
    colors: [
      primaryColor,
      primaryColor,
    ],
    transform: GradientRotation(3.14159),
  );
  static const Color midWhite = Color(0xffEEEEEE);
}
