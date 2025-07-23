import 'package:aichat/src/common_widgets/responsive_UI/responsive_center.dart';
import 'package:aichat/src/features/onboarding/wizard/presentation/widgets/wizard_page_widget.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WizardScreen extends StatefulWidget {
  const WizardScreen({super.key});

  @override
  State<WizardScreen> createState() => _WizardScreenState();
}

class _WizardScreenState extends State<WizardScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const int _totalPages = 2;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      _navigateToWelcome();
    }
  }

  void _navigateToWelcome() {
    context.goNamed(RoutesName.welcomeSign.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundLight,
      body: SafeArea(
        child: ResponsiveCenter(
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              _currentPage = page;
            },
            children: [
              RepaintBoundary(
                child: WizardPageWidget(
                  imagePath: 'assets/images/wizard_page1.png',
                  title: context.l10n.wizardPage1Title,
                  subtitle: context.l10n.wizardPage1Subtitle,
                  onSkip: _navigateToWelcome,
                  onNext: _nextPage,
                  buttonText: context.l10n.next,
                ),
              ),
              RepaintBoundary(
                child: WizardPageWidget(
                  imagePath: 'assets/images/wizard_page2.png',
                  title: context.l10n.wizardPage2Title,
                  subtitle: context.l10n.wizardPage2Subtitle,
                  onSkip: _navigateToWelcome,
                  onNext: _nextPage,
                  buttonText: context.l10n.getStarted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
