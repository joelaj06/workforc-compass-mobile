import 'package:get/get.dart';
import 'package:work_compass/features/authentication/presentation/login/getx/login_bindings.dart';
import 'package:work_compass/features/authentication/presentation/login/screens/login_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/attendance/screens/attendance_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/base/screens/base_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/home/screens/home_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/more/screens/more_screens.dart';
import 'package:work_compass/features/workforce_compass/presentation/notification/screens/notification_screen.dart';

import '../../../features/workforce_compass/presentation/onboarding/screens/onboarding_screen.dart';
import 'app_routes.dart';

class Pages {
  static final List<GetPage<AppRoutes>> pages = <GetPage<AppRoutes>>[
    GetPage<AppRoutes>(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
    ),GetPage<AppRoutes>(
      name: AppRoutes.base,
      page: () => const BaseScreen(),
    ),

    GetPage<AppRoutes>(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ), GetPage<AppRoutes>(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ), GetPage<AppRoutes>(
      name: AppRoutes.attendance,
      page: () => const AttendanceScreen(),
    ), GetPage<AppRoutes>(
      name: AppRoutes.notification,
      page: () => const NotificationScreen(),
    ), GetPage<AppRoutes>(
      name: AppRoutes.more,
      page: () => const MoreScreen(),
    ),

  ];
}
