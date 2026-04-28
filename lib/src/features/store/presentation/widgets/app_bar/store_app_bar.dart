import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const StoreAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(
        context.l10n.somethingToBuy,
        style: context.textStyles.authTitle.copyWith(
          color: context.colors.textDark,
        ),
      ),
      iconTheme: IconThemeData(
        color: context.colors.textDark,
      ),
      backgroundColor: context.colors.backgroundLight,
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
