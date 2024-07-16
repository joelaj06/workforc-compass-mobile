import 'package:get/get.dart';

import '../../../features/workforce_compass/presentation/onboarding/screens/onboarding_screen.dart';
import 'app_routes.dart';

class Pages {
  static final List<GetPage<AppRoutes>> pages = <GetPage<AppRoutes>>[
    GetPage<AppRoutes>(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
    ),

  ];
}
