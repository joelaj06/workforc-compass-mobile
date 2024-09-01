import 'package:get/get.dart';
import 'package:work_compass/features/authentication/presentation/login/getx/login_bindings.dart';
import 'package:work_compass/features/authentication/presentation/login/screens/login_screen.dart';
import 'package:work_compass/features/authentication/presentation/signup/getx/signup_bindings.dart';
import 'package:work_compass/features/authentication/presentation/signup/screens/singup_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/attendance/getx/attendance_bindings.dart';
import 'package:work_compass/features/workforce_compass/presentation/attendance/screens/attendance_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/base/screens/base_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/chat/getx/chat_bindings.dart';
import 'package:work_compass/features/workforce_compass/presentation/chat/screens/chat_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/home/getx/home_bindings.dart';
import 'package:work_compass/features/workforce_compass/presentation/home/screens/home_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/message/getx/message_bindings.dart';
import 'package:work_compass/features/workforce_compass/presentation/message/screens/message_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/more/screens/more_screens.dart';
import 'package:work_compass/features/workforce_compass/presentation/notification/screens/notification_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/profile/getx/profile_bindings.dart';
import 'package:work_compass/features/workforce_compass/presentation/profile/screen/profile_screen.dart';
import 'package:work_compass/features/workforce_compass/presentation/task/getx/task_bindings.dart';
import 'package:work_compass/features/workforce_compass/presentation/task/screens/task_screen.dart';

import '../../../features/workforce_compass/presentation/onboarding/screens/onboarding_screen.dart';
import 'app_routes.dart';

class Pages {
  static final List<GetPage<AppRoutes>> pages = <GetPage<AppRoutes>>[
    GetPage<AppRoutes>(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage<AppRoutes>(
        name: AppRoutes.base,
        page: () => const BaseScreen(),
        bindings: <Bindings>[
          HomeBindings(),
          AttendanceBindings(),
          ChatBindings(),
          ProfileBindings(),
        ]),
    GetPage<AppRoutes>(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.signup,
      page: () => const SignUpScreen(),
      binding: SignUpBindings(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.attendance,
      page: () => const AttendanceScreen(),
      binding: AttendanceBindings(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.notification,
      page: () => const NotificationScreen(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.more,
      page: () => const MoreScreen(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.task,
      page: () => const TaskScreen(),
      binding: TaskBindings(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.chats,
      page: () => const ChatScreen(),
      binding: ChatBindings(),
    ),  GetPage<AppRoutes>(
      name: AppRoutes.messages,
      page: () => const MessageScreen(),
      binding: MessageBindings(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBindings(),
    ),
  ];
}
