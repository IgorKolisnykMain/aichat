import 'package:aichat/core/theme/constants.dart';
import 'package:aichat/core/theme/extension/theme_colors.dart';
import 'package:aichat/core/theme/extension/theme_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData createLightTheme() => ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[ThemeColors.light, ThemeTextStyles.light()],
);

ThemeData createDarkTheme() => ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[ThemeColors.dark, ThemeTextStyles.dark()],
);
