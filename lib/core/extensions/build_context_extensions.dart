import 'package:aichat/core/theme/constants.dart';
import 'package:aichat/core/theme/extension/theme_colors.dart';
import 'package:aichat/core/theme/extension/theme_text_styles.dart';
import 'package:aichat/domain/model/app_config/app_config.dart';
import 'package:aichat/l10n/app_localizations.dart';
import 'package:aichat/presentation/widgets/app_config_provider.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  ThemeColors get colors => Theme.of(this).extension<ThemeColors>()!;

  AppDimensions get dimensions => AppDimensions.instance;

  ThemeTextStyles get textStyles => Theme.of(this).extension<ThemeTextStyles>()!;

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  AppConfig get appConfig => AppConfigProvider.of(this)!.config;

  String get languageCode => Localizations.localeOf(this).languageCode;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get statusBarHeight => mediaQuery.viewPadding.top;
  double get bottomInset => mediaQuery.viewInsets.bottom;
  double get systemNavBarHeight => mediaQuery.viewPadding.bottom;

  bool get alwaysUse24HourFormat => MediaQuery.of(this).alwaysUse24HourFormat;
}

extension TextStyleExt on TextStyle {
  TextStyle copyWithColor(Color color) => copyWith(color: color);

  TextStyle secondary(BuildContext context) => copyWithColor(context.colors.white);
}
