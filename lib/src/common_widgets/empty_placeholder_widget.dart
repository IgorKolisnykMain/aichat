import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/constants/app_sizes.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Placeholder widget showing a message and CTA to go back to the home screen.
class EmptyPlaceholderWidget extends StatelessWidget {
  const EmptyPlaceholderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            gapH32,
            AppPrimaryButton.infinity(
              onPressed: () => context.goNamed(RoutesName.home.name),
              text: context.l10n.goHome,
            ),
          ],
        ),
      ),
    );
  }
}
