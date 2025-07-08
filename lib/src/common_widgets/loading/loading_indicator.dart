import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? backgroundColor;
  final Color? indicatorColor;

  const LoadingIndicator({super.key, this.backgroundColor, this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? Colors.black.withValues(alpha: 0.3),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(12.r)),
          child: CircularProgressIndicator(color: indicatorColor ?? context.colors.primary),
        ),
      ),
    );
  }
}
