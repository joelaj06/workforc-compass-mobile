import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../../../main_bindings.dart';
import '../routes/app_routes.dart';
import '../routes/pages.dart';
import '../theme/app_light_theme.dart';
import '../theme/app_theme.dart';
class WorkCompass extends StatelessWidget {
  const WorkCompass({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (  BuildContext context,
          Widget? child,) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Marketline StoreFront',
          theme: AppTheme(AppLightTheme()).data,
          getPages: Pages.pages,
          initialBinding: MainBindings(),
          initialRoute:  AppRoutes.onboarding
      ),
    );
  }
}
