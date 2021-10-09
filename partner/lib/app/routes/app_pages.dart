import 'package:get/get.dart';

import 'package:partner/app/modules/auth/bindings/auth_binding.dart';
import 'package:partner/app/modules/auth/views/auth_view.dart';
import 'package:partner/app/modules/home/bindings/home_binding.dart';
import 'package:partner/app/modules/home/views/home_view.dart';
import 'package:partner/app/modules/notifications/bindings/notifications_binding.dart';
import 'package:partner/app/modules/notifications/views/notifications_view.dart';
import 'package:partner/app/modules/profile/bindings/profile_binding.dart';
import 'package:partner/app/modules/profile/views/profile_view.dart';
import 'package:partner/app/modules/signup/bindings/signup_binding.dart';
import 'package:partner/app/modules/signup/views/signup_view.dart';
import 'package:partner/app/modules/startup/bindings/startup_binding.dart';
import 'package:partner/app/modules/startup/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.STARTUP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.STARTUP,
      page: () => StartUpView(),
      binding: StartupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
  ];
}
