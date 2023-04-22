import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raam_dhulaai/src/core/assets/assets.gen.dart';
import 'package:raam_dhulaai/src/core/extensions/extensions.dart';
import 'package:raam_dhulaai/src/core/theme/app_styles.dart';
import 'package:raam_dhulaai/src/core/widgets/widgets.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key, required this.onPressed, required this.buttonTitle}) : super(key: key);
  final VoidCallback onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Assets.images.welcome.image(),
              20.verticalSpace,
              Text('Welcome!', style: AppStyles.text30PxBold.softBlack),
              const Spacer(),
              Text(
                "We clean\nso you don't have to",
                textAlign: TextAlign.center,
                style: AppStyles.text18PxMedium.midGrey,
              ),
              const Spacer(),
              CustomButton(
                title: buttonTitle,
                isDisabled: false,
                width: 270.w,
                onPressed: () async {
                  onPressed();
                },
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
