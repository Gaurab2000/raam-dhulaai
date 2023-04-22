import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raam_dhulaai/src/core/assets/assets.gen.dart';
import 'package:raam_dhulaai/src/core/extensions/extensions.dart';
import 'package:raam_dhulaai/src/core/routes/app_router.dart';
import 'package:raam_dhulaai/src/core/theme/app_styles.dart';
import 'package:raam_dhulaai/src/core/theme/theme.dart';
import 'package:raam_dhulaai/src/core/widgets/widgets.dart';

class LoginChoiceView extends StatelessWidget {
  const LoginChoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade400,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Assets.images.logo.image(),
              const Spacer(),
              Text(
                'A Complete Laundry Solutions',
                textAlign: TextAlign.center,
                style: AppStyles.text18PxMedium.white,
              ),
              const Spacer(),
              CustomButton(
                title: 'Get Service',
                onPressed: () => context.router.push(const LoginUserRoute()),
                isDisabled: false,
                backgroundColor: AppColors.whiteColor,
                titleStyle: AppStyles.text14PxMedium.softBlack,
                width: 270,
              ),
              30.verticalSpace,
              CustomButton(
                title: 'Provide Service',
                onPressed: () => context.router.push(const MerchantLoginRoute()),
                isDisabled: false,
                backgroundColor: AppColors.whiteColor,
                titleStyle: AppStyles.text14PxMedium.softBlack,
                width: 270,
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
