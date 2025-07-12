import 'package:aichat/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

const plusJakartaSans = 'PlusJakartaSans';
const lexend = 'Lexend';

class AppColors {
  // ==================== BASE COLORS ====================
  static const Color white = Color(0xFFFFFFFF); // fill_QCFKFO - Pure white
  static const Color black = Color(0xFF000000); // Pure black

  // ==================== BACKGROUND COLORS ====================
  static const Color backgroundLight = Color(0xFFFAFAFA); // fill_4LU0R9 - Light gray background
  static const Color backgroundSubtle = Color(0xFFF7FAFA); // fill_IAZZYB - Very light grayish
  static const Color backgroundAccent = Color(0xFFEBF2F0); // fill_REAUL0 - Light teal background
  static const Color backgroundAccentSubtle = Color(0xFFE8F2F2); // fill_7161AM - Very light teal

  // ==================== TEXT COLORS ====================
  static const Color textPrimary = Color(0xFF0F1717); // fill_NMI0YI - Dark text
  static const Color textDark = Color(0xFF0F141A); // fill_HTMO5U - Very dark text
  static const Color textDarkest = Color(0xFF0F1A1A); // fill_XVRJAL - Darkest text variant
  static const Color textSecondary = Color(0xFF444444); // fill_WJQ0KH - Medium gray text

  // ==================== PRIMARY COLORS ====================
  static const Color primaryLight = Color(0xFF9CDECF); // fill_AN31O9 - Light teal/mint
  static const Color primary = Color(0xFF5C8A80); // fill_Y0BMNI - Primary teal
  static const Color primaryDark = Color(0xFF5C8A85); // fill_ZL4RDE - Darker teal variant
  static const Color primaryMedium = Color(0xFF54948A); // fill_OT5FE3 - Medium teal

  // ==================== BORDER COLORS ====================
  static const Color borderSubtle = Color(0xFFD4E3DE); // stroke_1562GC - Light gray-green border
  static const Color borderWhite10 = Color(0x1AFFFFFF); // stroke_2NTFN8 - White with 10% opacity
}

class AppDimensions {
  static final AppDimensions _instance = AppDimensions._();
  static AppDimensions get instance => _instance;

  AppDimensions._();

  double get paddingSmall => 8.rw;
  double get paddingMedium => 16.rw;
  double get paddingLarge => 24.rw;
  double get paddingExtraLarge => 32.rw;

  double get radiusSmall => 4.rr;
  double get radiusMedium => 8.rr;
  double get radiusLarge => 16.rr;
  double get radiusExtraLarge => 24.rr;
}
