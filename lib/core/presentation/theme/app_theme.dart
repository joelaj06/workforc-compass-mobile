import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_compass/core/presentation/theme/secondary_color.dart';

import '../utils/app_border_radius.dart';
import 'theme.dart';

class AppTheme {
  const AppTheme(this.colors);

  final ThemeColor colors;

  ThemeData get data => ThemeData(
        useMaterial3: true,
        fontFamily: AppFonts.poppins,
        primaryColorLight: colors.primary,
        primarySwatch: colors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryIconTheme: IconThemeData(
          color: colors.primary,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: colors.primary,
          //primaryColorDark: colors.primary.shade900,
          accentColor: colors.accent,
          cardColor: colors.background,
          backgroundColor: colors.background,
          errorColor: colors.error,
          brightness: colors.brightness,
        ),
        focusColor: colors.primary,
        primaryColor: colors.primary,
        brightness: colors.brightness,
        scaffoldBackgroundColor: colors.background,
        unselectedWidgetColor: colors.lightBlue,
        disabledColor: colors.lightBlue,
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: colors.textDark,
          labelColor: Colors.white,
          indicator: BoxDecoration(
            borderRadius: AppBorderRadius.button,
            color: colors.primary,
          ),
          labelStyle: caption.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontFamily: AppFonts.base,
            letterSpacing: -.25,
            fontSize: 15,
          ),
          unselectedLabelStyle: caption.copyWith(
            color: colors.textDark,
            fontWeight: FontWeight.w700,
            letterSpacing: -.25,
            fontSize: 15,
            fontFamily: AppFonts.base,
          ),
        ),
        textTheme: TextTheme(
          displaySmall: h3,
          headlineMedium: h4,
          headlineSmall: h5,
          titleLarge: h6,
          bodyLarge: body1,
          bodyMedium: body2,
          titleMedium: sub1,
          titleSmall: sub2,
          labelSmall: overline,
          bodySmall: caption,
          labelLarge: button,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: SecondaryColor.color),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          toolbarTextStyle: body1,
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: body1.copyWith(
            fontSize: AppFontSizes.h6,
            fontWeight: FontWeight.w600,
            color: colors.textDark,
            fontFamily: AppFonts.base,
          ),
          iconTheme: IconThemeData(
            color: colors.primary,
          ),
        ),
        iconTheme: IconThemeData(
          color: colors.text,
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          height: 50,
        ),
        indicatorColor: colors.primary,
        canvasColor: colors.background,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.text;
            }
            return null;
          }),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.text;
            }
            return null;
          }),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.text;
            }
            return null;
          }),
          trackColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.text;
            }
            return null;
          }),
        ),
        /*inputDecorationTheme: InputDecorationTheme(
          focusColor: colors.text,
          labelStyle: body1.copyWith(
            height: 1.8,
            fontWeight: FontWeight.w800,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.largeAll,
            borderSide: BorderSide(
              color: colors.primary.shade100,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.largeAll,
              borderSide: BorderSide(
                color: colors.primary.shade100,
              )),
          disabledBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.largeAll,
            borderSide: BorderSide(
              color: colors.hintLight,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.primary.shade100,
              width: 0.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: AppBorderRadius.largeAll,
            borderSide: BorderSide(
              color: colors.primary.shade100,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          fillColor: Colors.transparent,
          errorStyle: TextStyle(
            color: colors.error,
            fontSize: 12,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          alignLabelWithHint: true,
          hintStyle: body1.copyWith(
            color: colors.hint,
            height: 1.2,
          ),
        ),*/
      );

  TextStyle get h2 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  TextStyle get h3 => TextStyle(
        fontSize: AppFontSizes.h3,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.base,
        color: colors.secondary,
      );

  TextStyle get h4 => TextStyle(
        fontSize: AppFontSizes.h4,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.base,
        color: colors.secondary,
      );

  TextStyle get h5 => TextStyle(
        fontSize: AppFontSizes.h5,
        fontFamily: AppFonts.base,
        fontWeight: FontWeight.w600,
        color: colors.secondary,
      );

  TextStyle get h6 => TextStyle(
        fontSize: AppFontSizes.h6,
        fontWeight: FontWeight.w500,
        // color: colors.secondary,
        //  fontFamily: AppFonts.base,
      );

  TextStyle get sub1 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        /* fontSize: AppFontSizes.subtitle1,
        fontWeight: FontWeight.w400,
        color: colors.text,*/
      );

  TextStyle get sub2 => const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1,
        /* fontSize: AppFontSizes.subtitle2,
        fontWeight: FontWeight.w500,
        color: colors.text,*/
        // letterSpacing: .1,
      );

  TextStyle get body1 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        /*fontSize: AppFontSizes.bodyText1,
        fontWeight: FontWeight.w600,
        color: colors.text,*/
      );

  TextStyle get body2 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        /*fontSize: AppFontSizes.bodyText2,
        fontWeight: FontWeight.w600,
        color: colors.text,*/
      );

  TextStyle get caption => TextStyle(
        fontSize: AppFontSizes.caption,
        color: colors.hint.shade300,
      );

  TextStyle get overline => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colors.hint,
        letterSpacing: .4,
      );

  TextStyle get button => const TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.25);

  TextStyle get smallest => TextStyle(
        fontSize: AppFontSizes.smallest,
        fontWeight: FontWeight.w500,
        color: colors.text,
        letterSpacing: .7,
      );
}

class AppFontSizes {
  AppFontSizes._();

  static double h3 = 48.sp.toDouble();
  static double h4 = 32.sp.toDouble();
  static double h5 = 24.sp.toDouble();
  static double h6 = 20.sp.toDouble();
  static double subtitle1 = 18.sp.toDouble(); //SEMI-BOLD
  static double subtitle2 = 14.sp.toDouble(); //SEMI-BOLD
  static double bodyText1 = 16.sp.toDouble();
  static double bodyText2 = 14.sp.toDouble();
  static double caption = 12.sp.toDouble();
  static double button = 18.sp.toDouble();
  static double overline = 10.sp.toDouble();
  static double smallest = 8.sp.toDouble();
}

class AppFontWeight {
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w800;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeColor get colors => AppLightTheme();

  TextStyle get h2 => theme.textTheme.displayMedium!;

  TextStyle get h3 => theme.textTheme.displaySmall!;

  TextStyle get h4 => theme.textTheme.headlineMedium!;

  TextStyle get h5 => theme.textTheme.headlineSmall!;

  TextStyle get h6 => theme.textTheme.titleLarge!;

  TextStyle get sub1 => theme.textTheme.titleMedium!;

  TextStyle get sub2 => theme.textTheme.titleSmall!;

  TextStyle get body1 => theme.textTheme.bodyLarge!;

  TextStyle get body2 => theme.textTheme.bodyMedium!;

  TextStyle get body2Bold =>
      theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800);

  TextStyle get bodyError => theme.textTheme.bodyMedium!
      .copyWith(color: Theme.of(this).colorScheme.error);

  TextStyle get caption => theme.textTheme.bodySmall!;

  TextStyle get smallest =>
      theme.textTheme.bodyMedium!.copyWith(fontSize: AppFontSizes.smallest);

  TextStyle get captionError => theme.textTheme.bodySmall!
      .copyWith(color: Theme.of(this).colorScheme.error);

  TextStyle get button => theme.textTheme.labelLarge!;

  TextStyle get buttonSmall =>
      theme.textTheme.labelLarge!.copyWith(fontSize: AppFontSizes.caption);

  TextStyle get overline => theme.textTheme.labelSmall!;

  TextStyle get appBarTitle => theme.textTheme.bodyLarge!.copyWith(
        fontSize: AppFontSizes.h6,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.base,
      );

  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;
}
