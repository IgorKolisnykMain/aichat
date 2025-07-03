import 'package:aichat/core/theme/constants.dart';
import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  // ==================== BASE COLORS ====================
  final Color white;
  final Color black;

  // ==================== BACKGROUND COLORS ====================
  final Color backgroundLight;
  final Color backgroundSubtle;
  final Color backgroundAccent;
  final Color backgroundAccentSubtle;

  // ==================== TEXT COLORS ====================
  final Color textPrimary;
  final Color textDark;
  final Color textDarkest;
  final Color textSecondary;

  // ==================== PRIMARY COLORS ====================
  final Color primaryLight;
  final Color primary;
  final Color primaryDark;
  final Color primaryMedium;

  // ==================== BORDER COLORS ====================
  final Color borderSubtle;
  final Color borderWhite10;

  const ThemeColors({
    // Base colors
    required this.white,
    required this.black,
    // Background colors
    required this.backgroundLight,
    required this.backgroundSubtle,
    required this.backgroundAccent,
    required this.backgroundAccentSubtle,
    // Text colors
    required this.textPrimary,
    required this.textDark,
    required this.textDarkest,
    required this.textSecondary,
    // Primary colors
    required this.primaryLight,
    required this.primary,
    required this.primaryDark,
    required this.primaryMedium,
    // Border colors
    required this.borderSubtle,
    required this.borderWhite10,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    // Base colors
    Color? white,
    Color? black,
    // Background colors
    Color? backgroundLight,
    Color? backgroundSubtle,
    Color? backgroundAccent,
    Color? backgroundAccentSubtle,
    // Text colors
    Color? textPrimary,
    Color? textDark,
    Color? textDarkest,
    Color? textSecondary,
    // Primary colors
    Color? primaryLight,
    Color? primary,
    Color? primaryDark,
    Color? primaryMedium,
    // Border colors
    Color? borderSubtle,
    Color? borderWhite10,
  }) {
    return ThemeColors(
      // Base colors
      white: white ?? this.white,
      black: black ?? this.black,
      // Background colors
      backgroundLight: backgroundLight ?? this.backgroundLight,
      backgroundSubtle: backgroundSubtle ?? this.backgroundSubtle,
      backgroundAccent: backgroundAccent ?? this.backgroundAccent,
      backgroundAccentSubtle: backgroundAccentSubtle ?? this.backgroundAccentSubtle,
      // Text colors
      textPrimary: textPrimary ?? this.textPrimary,
      textDark: textDark ?? this.textDark,
      textDarkest: textDarkest ?? this.textDarkest,
      textSecondary: textSecondary ?? this.textSecondary,
      // Primary colors
      primaryLight: primaryLight ?? this.primaryLight,
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryMedium: primaryMedium ?? this.primaryMedium,
      // Border colors
      borderSubtle: borderSubtle ?? this.borderSubtle,
      borderWhite10: borderWhite10 ?? this.borderWhite10,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      // Base colors
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      // Background colors
      backgroundLight: Color.lerp(backgroundLight, other.backgroundLight, t)!,
      backgroundSubtle: Color.lerp(backgroundSubtle, other.backgroundSubtle, t)!,
      backgroundAccent: Color.lerp(backgroundAccent, other.backgroundAccent, t)!,
      backgroundAccentSubtle: Color.lerp(backgroundAccentSubtle, other.backgroundAccentSubtle, t)!,
      // Text colors
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textDark: Color.lerp(textDark, other.textDark, t)!,
      textDarkest: Color.lerp(textDarkest, other.textDarkest, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      // Primary colors
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      primaryMedium: Color.lerp(primaryMedium, other.primaryMedium, t)!,
      // Border colors
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      borderWhite10: Color.lerp(borderWhite10, other.borderWhite10, t)!,
    );
  }

  static const ThemeColors light = ThemeColors(
    // Base colors
    white: AppColors.white,
    black: AppColors.black,
    // Background colors
    backgroundLight: AppColors.backgroundLight,
    backgroundSubtle: AppColors.backgroundSubtle,
    backgroundAccent: AppColors.backgroundAccent,
    backgroundAccentSubtle: AppColors.backgroundAccentSubtle,
    // Text colors
    textPrimary: AppColors.textPrimary,
    textDark: AppColors.textDark,
    textDarkest: AppColors.textDarkest,
    textSecondary: AppColors.textSecondary,
    // Primary colors
    primaryLight: AppColors.primaryLight,
    primary: AppColors.primary,
    primaryDark: AppColors.primaryDark,
    primaryMedium: AppColors.primaryMedium,
    // Border colors
    borderSubtle: AppColors.borderSubtle,
    borderWhite10: AppColors.borderWhite10,
  );

  static ThemeColors get dark => light;
}
