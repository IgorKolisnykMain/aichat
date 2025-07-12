import 'package:aichat/src/core/theme/constants.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  // Plus Jakarta Sans Styles
  // Headers and Titles
  final TextStyle onboardingTitle; // 700, 28px - "Personalized Help", "Express Yourself"
  final TextStyle splashTitle; // 700, 32px - "HearMeOut" splash
  final TextStyle subscriptionTitle; // 700, 18px - "Choose Your Plan"
  final TextStyle planTitle; // 700, 16px - plan titles
  final TextStyle priceDisplay; // 800, 36px - prices ($9.99, $99)

  // Body Text
  final TextStyle bodyLarge; // 400, 16px - descriptions, chat messages
  final TextStyle bodyMedium; // 400, 14px - "Already subscribed?"
  final TextStyle bodySmall; // 400, 13px - feature lists, "User" label

  // Buttons and Actions
  final TextStyle buttonLarge; // 700, 16px - "Continue" button
  final TextStyle buttonMedium; // 700, 14px - "Skip", "Next" buttons

  // Other
  final TextStyle saveBadge; // 500, 12px - "Save 20%"

  // Lexend Styles (Authentication)
  final TextStyle authBrand; // 700, 24px - "HearMeOut" auth
  final TextStyle authTitle; // 700, 18px - auth titles
  final TextStyle authBody; // 400, 16px - auth descriptions, input placeholders
  final TextStyle authButton; // 700, 16px - auth buttons
  final TextStyle authLink; // 400, 14px - auth links, "Forgot password?"

  const ThemeTextStyles._({
    // Plus Jakarta Sans
    required this.onboardingTitle,
    required this.splashTitle,
    required this.subscriptionTitle,
    required this.planTitle,
    required this.priceDisplay,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.buttonLarge,
    required this.buttonMedium,
    required this.saveBadge,
    // Lexend
    required this.authBrand,
    required this.authTitle,
    required this.authBody,
    required this.authButton,
    required this.authLink,
  });

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? onboardingTitle,
    TextStyle? splashTitle,
    TextStyle? subscriptionTitle,
    TextStyle? planTitle,
    TextStyle? priceDisplay,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? buttonLarge,
    TextStyle? buttonMedium,
    TextStyle? saveBadge,
    TextStyle? authBrand,
    TextStyle? authTitle,
    TextStyle? authBody,
    TextStyle? authButton,
    TextStyle? authLink,
  }) {
    return ThemeTextStyles._(
      onboardingTitle: onboardingTitle ?? this.onboardingTitle,
      splashTitle: splashTitle ?? this.splashTitle,
      subscriptionTitle: subscriptionTitle ?? this.subscriptionTitle,
      planTitle: planTitle ?? this.planTitle,
      priceDisplay: priceDisplay ?? this.priceDisplay,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      buttonLarge: buttonLarge ?? this.buttonLarge,
      buttonMedium: buttonMedium ?? this.buttonMedium,
      saveBadge: saveBadge ?? this.saveBadge,
      authBrand: authBrand ?? this.authBrand,
      authTitle: authTitle ?? this.authTitle,
      authBody: authBody ?? this.authBody,
      authButton: authButton ?? this.authButton,
      authLink: authLink ?? this.authLink,
    );
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(ThemeExtension<ThemeTextStyles>? other, double t) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles._(
      onboardingTitle: TextStyle.lerp(onboardingTitle, other.onboardingTitle, t)!,
      splashTitle: TextStyle.lerp(splashTitle, other.splashTitle, t)!,
      subscriptionTitle: TextStyle.lerp(subscriptionTitle, other.subscriptionTitle, t)!,
      planTitle: TextStyle.lerp(planTitle, other.planTitle, t)!,
      priceDisplay: TextStyle.lerp(priceDisplay, other.priceDisplay, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      buttonLarge: TextStyle.lerp(buttonLarge, other.buttonLarge, t)!,
      buttonMedium: TextStyle.lerp(buttonMedium, other.buttonMedium, t)!,
      saveBadge: TextStyle.lerp(saveBadge, other.saveBadge, t)!,
      authBrand: TextStyle.lerp(authBrand, other.authBrand, t)!,
      authTitle: TextStyle.lerp(authTitle, other.authTitle, t)!,
      authBody: TextStyle.lerp(authBody, other.authBody, t)!,
      authButton: TextStyle.lerp(authButton, other.authButton, t)!,
      authLink: TextStyle.lerp(authLink, other.authLink, t)!,
    );
  }

  ThemeTextStyles.light()
    : this._(
        // Plus Jakarta Sans Styles
        onboardingTitle: TextStyle(
          fontFamily: plusJakartaSans,
          fontWeight: FontWeight.w700,
          fontSize: 28.rsp,
          height: 1.2,
          color: AppColors.textPrimary,
        ),
        splashTitle: TextStyle(
          fontFamily: plusJakartaSans,
          fontWeight: FontWeight.w700,
          fontSize: 32.rsp,
          height: 1.2,
          color: AppColors.textPrimary,
        ),
        subscriptionTitle: TextStyle(
          fontFamily: plusJakartaSans,
          fontWeight: FontWeight.w700,
          fontSize: 18.rsp,
          height: 1.3,
          color: AppColors.textPrimary,
        ),
        planTitle: TextStyle(
          fontFamily: plusJakartaSans,
          fontWeight: FontWeight.w700,
          fontSize: 16.rsp,
          height: 1.3,
          color: AppColors.textPrimary,
        ),
        priceDisplay: TextStyle(
          fontFamily: plusJakartaSans,
          fontWeight: FontWeight.w800,
          fontSize: 36.rsp,
          height: 1.1,
          color: AppColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontFamily: plusJakartaSans,
          fontWeight: FontWeight.w400,
          fontSize: 16.rsp,
          height: 1.5,
          color: AppColors.textSecondary,
        ),
        bodyMedium: TextStyle(
          fontFamily: plusJakartaSans,
          fontWeight: FontWeight.w400,
          fontSize: 14.rsp,
          height: 1.5,
          color: AppColors.textSecondary,
        ),
        bodySmall: TextStyle(
          fontFamily: plusJakartaSans,
          fontWeight: FontWeight.w400,
          fontSize: 13.rsp,
          height: 1.5,
          color: AppColors.textSecondary,
        ),
        buttonLarge: TextStyle(
          fontFamily: plusJakartaSans,
          fontWeight: FontWeight.w700,
          fontSize: 16.rsp,
          height: 1.25,
          color: AppColors.textPrimary,
        ),
        buttonMedium: TextStyle(
          fontFamily: plusJakartaSans,
          fontWeight: FontWeight.w700,
          fontSize: 14.rsp,
          height: 1.25,
          color: AppColors.textPrimary,
        ),
        saveBadge: TextStyle(
          fontFamily: plusJakartaSans,
          fontWeight: FontWeight.w500,
          fontSize: 12.rsp,
          height: 1.3,
          color: AppColors.textPrimary,
        ),
        // Lexend Styles
        authBrand: TextStyle(
          fontFamily: lexend,
          fontWeight: FontWeight.w700,
          fontSize: 24.rsp,
          height: 1.2,
          color: AppColors.textPrimary,
        ),
        authTitle: TextStyle(
          fontFamily: lexend,
          fontWeight: FontWeight.w700,
          fontSize: 18.rsp,
          height: 1.3,
          color: AppColors.textPrimary,
        ),
        authBody: TextStyle(
          fontFamily: lexend,
          fontWeight: FontWeight.w400,
          fontSize: 16.rsp,
          height: 1.5,
          color: AppColors.textSecondary,
        ),
        authButton: TextStyle(
          fontFamily: lexend,
          fontWeight: FontWeight.w700,
          fontSize: 16.rsp,
          height: 1.25,
          color: AppColors.textPrimary,
        ),
        authLink: TextStyle(
          fontFamily: lexend,
          fontWeight: FontWeight.w400,
          fontSize: 14.rsp,
          height: 1.5,
          color: AppColors.textSecondary,
        ),
      );

  ThemeTextStyles.dark() : this.light();
}
