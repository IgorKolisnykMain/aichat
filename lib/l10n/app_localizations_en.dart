// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Hear Me Out';

  @override
  String get welcome => 'Welcome';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get defaultError => 'Something went wrong. Please try again.';

  @override
  String get noInternetConnection => 'No internet connection. Please check your network.';

  @override
  String get serverError => 'Server error. Please try again later.';

  @override
  String get splashTitle => 'HearMeOut';

  @override
  String get splashSubtitle => 'AI-Powered Emotional Support';

  @override
  String get wizardPage1Title => 'Personalized Help';

  @override
  String get wizardPage1Subtitle => 'Get insights and gentle guidance tailored to you.';

  @override
  String get wizardPage2Title => 'Express Yourself';

  @override
  String get wizardPage2Subtitle => 'Talk to our AI psychologist—express your feelings without judgment.';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get getStarted => 'Get Started';

  @override
  String get welcomeDescription => 'You\'re on track to feeling heard and supported.';

  @override
  String get continueWithApple => 'Continue with Apple';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get continueWithEmail => 'Continue with Email';

  @override
  String get emailAddress => 'Email address';

  @override
  String get logIn => 'Log In';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get haveAccountLogIn => 'Have an account? Log in';

  @override
  String get dontHaveAccountSignUp => 'Don\'t have an account? Sign up';

  @override
  String get recoverPassword => 'Recover Password';

  @override
  String get backToLogIn => 'Back to Log in';

  @override
  String get pleaseEnterEmail => 'Please enter your email';

  @override
  String get pleaseEnterPassword => 'Please enter your password';

  @override
  String passwordResetEmailSent(String email) {
    return 'Password reset email sent to $email';
  }

  @override
  String get passwordResetFailed => 'Failed to send password reset email';

  @override
  String get signInError => 'Sign in failed. Please try again.';

  @override
  String get signUpError => 'Sign up failed. Please try again.';

  @override
  String get chooseYourPlan => 'Choose Your Plan';

  @override
  String get freeTrial => 'Free Trial';

  @override
  String get freeTrialDescription => '7 days free, then \$9.99/mo';

  @override
  String get monthly => 'Monthly';

  @override
  String get yearly => 'Yearly';

  @override
  String get save20Percent => 'Save 20%';

  @override
  String get perMonth => '/ month';

  @override
  String get perYear => '/ year';

  @override
  String get unlimitedAIChats => 'Unlimited AI chats';

  @override
  String get weeklySummary => 'Weekly summary';

  @override
  String get continueText => 'Continue';

  @override
  String get alreadySubscribedRestore => 'Already subscribed? Restore Purchase.';

  @override
  String get genericError => 'Something went wrong. Please try again.';

  @override
  String get hearMeOutAiPsychologist => 'HearMeOut AI Psychologist';

  @override
  String get tellMeHowYouFeel => 'Tell me how you feel...';

  @override
  String get conversations => 'Conversations';

  @override
  String get newConversation => 'New Conversation';

  @override
  String get previousConversations => 'Previous Conversations';

  @override
  String get aiPsychologist => 'AI Psychologist';

  @override
  String get user => 'User';
}
