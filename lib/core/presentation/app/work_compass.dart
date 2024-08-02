import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../features/authentication/data/datasource/auth_local_data_source.dart';
import '../../../main_bindings.dart';
import '../../utils/shared_preferences_wrapper.dart';
import '../../utils/shared_prefs_keys.dart';
import '../routes/app_routes.dart';
import '../routes/pages.dart';
import '../theme/app_light_theme.dart';
import '../theme/app_theme.dart';
class WorkCompass extends StatelessWidget {
   const WorkCompass({required this.token, super.key});

  final String? token;

  @override
  Widget build(BuildContext context) {
    Get.put<SharedPreferencesWrapper>(
      SharedPreferencesWrapper(),
    );

    Get.put<AuthLocalDataSource>(
      AuthLocalDataSourceImpl(Get.find()),
    );

    final SharedPreferencesWrapper sharedPreferencesWrapper = Get.find();
    void storeDeviceToken() async {
      if (token != null) {
        await sharedPreferencesWrapper.setString(
            SharedPrefsKeys.fcmToken, token!);
      }
    }
    return Builder(
      builder: (BuildContext context) {
        storeDeviceToken();
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (  BuildContext context,
              Widget? child,) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Workforce Compass',
              theme: AppTheme(AppLightTheme()).data,
              getPages: Pages.pages,
              initialBinding: MainBindings(),
              initialRoute:  AppRoutes.login
          ),
        );
      }
    );
  }
}
