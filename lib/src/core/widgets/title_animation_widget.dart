import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raam_dhulaai/src/core/theme/app_styles.dart';
import 'package:raam_dhulaai/src/core/theme/theme.dart';

class TitleAnimationWidget extends StatelessWidget {
  const TitleAnimationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Raam-",
          style: AppStyles.text36PxBold
              .copyWith(fontSize: 42, color: AppColors.whiteColor, fontFamily: GoogleFonts.kaushanScript().fontFamily),
        ),
        Text(
          "Dhulaai",
          style: AppStyles.text36PxBold.copyWith(
              fontSize: 42, color: Colors.yellow.shade400, fontFamily: GoogleFonts.kaushanScript().fontFamily),
        ),
      ],
    )
        .animate()
        .shimmer(duration: 1800.ms, delay: 400.ms)
        .shake(hz: 2, curve: Curves.easeInOutCubic)
        .scaleXY(end: 1.1, duration: 600.ms)
        .then(delay: 600.ms)
        .scaleXY(end: 1 / 1.1);
  }
}
