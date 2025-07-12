import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';

class LoadingIndicator extends ConsumerWidget {
  final ProviderListenable<AsyncValue<dynamic>> provider;
  final Color? backgroundColor;
  final Color? indicatorColor;

  const LoadingIndicator({super.key, required this.provider, this.backgroundColor, this.indicatorColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(provider);

    return asyncValue.isLoading
        ? ColoredBox(
            color: backgroundColor ?? Colors.black.withValues(alpha: 0.3),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20.rsp),
                decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(12.rr)),
                child: CircularProgressIndicator(color: indicatorColor ?? context.colors.primary),
              ),
            ),
          )
        : const SizedBox();
  }
}
