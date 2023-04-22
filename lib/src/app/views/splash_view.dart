import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:raam_dhulaai/src/app/provider/auth_status_provider.dart';
import 'package:raam_dhulaai/src/auth/models/custom_user_model.dart';
import 'package:raam_dhulaai/src/core/assets/assets.gen.dart';
import 'package:raam_dhulaai/src/core/extensions/context_extension.dart';
import 'package:raam_dhulaai/src/core/extensions/extensions.dart';
import 'package:raam_dhulaai/src/core/providers/firbease_provider.dart';
import 'package:raam_dhulaai/src/core/routes/app_router.dart';
import 'package:raam_dhulaai/src/core/state/app_state.dart';
import 'package:raam_dhulaai/src/core/theme/app_colors.dart';
import 'package:raam_dhulaai/src/core/theme/app_styles.dart';
import 'package:raam_dhulaai/src/core/widgets/title_animation_widget.dart';
import 'package:raam_dhulaai/src/core/widgets/widgets.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect(() {
    //   NotificationService.instance.initilize();
    //   if (ref.read(firebaseAuthProvider).currentUser != null) {
    //     context.router.replaceAll([const DashboardRouter()]);
    //   }
    // }, []);
    ref.listen<AppState<CustomUserModel>>(authStatusNotifierProvider, (previous, next) {
      next.maybeWhen(
        orElse: () => null,
        success: (data) {
          ref.read(authChangeProvider);
          context.showSnackbar(message: 'Welcome Back ${data.name}');
          if (data.isMerchant) {
            /// navigate to merchant
            context.router.replaceAll([const MerchantDashboardRouter()]);
          } else {
            context.router.replaceAll([const DashboardRouter()]);
          }
        },
        error: (message) async {
          context.showSnackbar(message: message);
          // ignore: inference_failure_on_instance_creation
          await Future.delayed(const Duration(milliseconds: 300));
          context.router.push(const LoginChoiceRoute());
        },
      );
    });

    // ref.listen(authSatate, (previous, next) {
    //   if (next != null) {
    //     log(next.toString());
    //   }
    // });
    // final _authState = ref.watch(authSatate);
    // return Scaffold(
    //   backgroundColor: AppColors.primaryColor,
    //   body: _authState.when(
    //     data: (data) {
    //       if (data != null) {
    //         context.router.replaceAll([const DashboardRouter()]);
    //       }
    //       return _body(context);
    //     },
    //     error: (message, _) => _body(context),
    //     loading: () => _body(context),
    //   ),
    // );
    return ScaffoldWrapper(
      backgroundColor: AppColors.primaryColor,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Assets.images.machine
                .image()
                .animate()
                .shimmer(duration: 1800.ms, delay: 400.ms)
                .shake(hz: 2, curve: Curves.easeInOutCubic)
                .scaleXY(end: 1.1, duration: 600.ms, begin: 0.5)
                .then(delay: 800.ms)
                .scaleXY(end: 1 / 1.1), // inherits the delay & duration from move,
            TitleAnimationWidget(),
            const Spacer(),

            Consumer(builder: (context, ref, _) {
              return ref.watch(authStatusNotifierProvider).maybeWhen(
                    orElse: () => buildButton(ref, context),
                    success: (data) {
                      return const SizedBox.shrink();
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    error: (message) => buildButton(ref, context),
                  );
            }),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget buildButton(WidgetRef ref, BuildContext context) {
    return CustomButton(
      loading: ref.watch(authStatusNotifierProvider).maybeWhen(
            orElse: () => false,
            loading: () => true,
          ),
      title: 'Get Started',
      onPressed: () => context.router.push(const LoginChoiceRoute()),
      isDisabled: false,
      backgroundColor: AppColors.whiteColor,
      titleStyle: AppStyles.text14PxMedium.softBlack,
      width: 270,
    );
  }
}
