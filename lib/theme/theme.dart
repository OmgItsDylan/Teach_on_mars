import 'package:flutter/material.dart';
import 'package:teach_on_mars_test/theme/app_color.dart';
import 'package:teach_on_mars_test/theme/app_textstyle.dart';

abstract class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      color: AppColor.appBarColor,
      elevation: 0,
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateColor.resolveWith(
        (states) => const Color(0xFFD8D8D8),
      ),
      thumbColor: MaterialStateColor.resolveWith(
        (states) => const Color(0xFF2E66D4),
      ),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.postsListBackgroundColor,
    textTheme: TextTheme(
      bodySmall: AppTextStyle.postCardBodyTextStyle,
      bodyLarge: AppTextStyle.postCardTitleTextStyle,
      displayLarge: AppTextStyle.appBarTextStyle,
      labelLarge: AppTextStyle.primaryButtonTextStyle,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          AppTextStyle.primaryButtonTextStyle,
        ),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => const Color(0xFF2E66D4),
        ),
      ),
    ),
    cardColor: AppColor.postCardBackgroundColor,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: const Color(0xFF13B9FF),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: TextTheme(
      bodySmall: AppTextStyle.postCardBodyTextStyle,
      bodyLarge: AppTextStyle.postCardTitleTextStyle.copyWith(
        color: Colors.white,
      ),
      displayLarge: AppTextStyle.appBarTextStyle.copyWith(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          AppTextStyle.primaryButtonTextStyle,
        ),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => const Color(0xFF2E66D4),
        ),
      ),
    ),
    cardColor: Colors.black,
  );
}
