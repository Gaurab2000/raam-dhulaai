import 'package:auto_route/auto_route.dart';
import 'package:raam_dhulaai/src/app/views/views.dart';
import 'package:raam_dhulaai/src/auth/view/pages.dart';
import 'package:raam_dhulaai/src/chat/views/chat_list_view.dart';
import 'package:raam_dhulaai/src/cloth_recognition/cloth_recognition_view.dart';
import 'package:raam_dhulaai/src/home/views/marchent_home_view/merchant_bookings_view.dart';
import 'package:raam_dhulaai/src/home/views/marchent_home_view/pages.dart';
import 'package:raam_dhulaai/src/home/views/pages.dart';
import 'package:raam_dhulaai/src/map_view/views/views.dart';

export 'package:auto_route/auto_route.dart';

export 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute<void>(page: SplashView, initial: true),
    AutoRoute<void>(page: LoginChoiceView),
    AutoRoute<void>(page: UserSignupView),
    AutoRoute<void>(page: LoginUserView),
    AutoRoute<void>(page: MerchantSignupView),
    AutoRoute<void>(page: MerchantLoginView),
    AutoRoute<void>(page: WelcomeView),
    // map
    AutoRoute<void>(page: MapPickerView),

    // user home
    AutoRoute<void>(
      page: DashboardView,
      path: 'dashboard',
      name: 'DashboardRouter',
      children: [
        AutoRoute(
          page: HomeView,
          path: '',
          name: 'HomeRouter',
        ),
        AutoRoute(
          page: AppointmentView,
          path: 'bookmark',
          name: 'AppointmentRouter',
        ),
        AutoRoute(
          page: ChatListView,
          path: 'chat',
          name: 'ChatRouter',
        ),
        AutoRoute(
          page: ProfileView,
          path: 'profile',
          name: 'ProfileRouter',
        ),
      ],
    ),
    AutoRoute<void>(page: CategoryView),
    AutoRoute<void>(page: ClothRecognitionView),

    // chats
    AutoRoute<void>(page: ChatDetailView),
    AutoRoute<void>(page: ProductView),
    AutoRoute<void>(page: ProductSummaryView),
    AutoRoute<void>(page: SelectSlotView),
    AutoRoute<void>(page: CheckoutView),
    AutoRoute<void>(page: HelpAndSupportView),
    AutoRoute<void>(page: ProfileInfoView),

    /// merchant views
    ///

    AutoRoute<void>(
      name: 'MerchantDashboardRouter',
      page: MerchantDashboardView,
      children: [
        AutoRoute<void>(page: MerchantHomeView),
        AutoRoute<void>(page: MerchantBookingsView),
        AutoRoute<void>(page: ChatListView),
        AutoRoute<void>(page: ProfileView),
      ],
    ),
    AutoRoute<void>(page: CreateProductView),

    //
    AutoRoute<void>(page: VerifyEmailView),
  ],
)
class $AppRouter {}
