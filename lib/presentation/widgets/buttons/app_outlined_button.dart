import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aichat/core/extensions/build_context_extensions.dart';
import 'package:aichat/presentation/widgets/buttons/app_primary_button.dart';

class AppOutlinedButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Size? minimumSize;
  final TextStyle? textStyle;
  final Widget? child;
  final ButtonViewStyle viewStyle;
  final EdgeInsets? padding;
  final double? borderRadius;
  final Color? borderColor;
  final Color? color;
  final bool enabled;
  final EdgeInsets margin;

  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.minimumSize,
    this.textStyle,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.color,
    this.enabled = true,
    this.margin = EdgeInsets.zero,
  }) : child = null,
       viewStyle = ButtonViewStyle.base;

  const AppOutlinedButton.infinity({
    super.key,
    required this.text,
    required this.onPressed,
    this.minimumSize,
    this.textStyle,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.color,
    this.enabled = true,
    this.margin = EdgeInsets.zero,
  }) : child = null,
       viewStyle = ButtonViewStyle.widthInfinity;

  const AppOutlinedButton.expanded({
    super.key,
    required this.text,
    required this.onPressed,
    this.minimumSize,
    this.textStyle,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.color,
    this.enabled = true,
    this.margin = EdgeInsets.zero,
  }) : child = null,
       viewStyle = ButtonViewStyle.expanded;

  const AppOutlinedButton.build({
    super.key,
    required this.child,
    required this.onPressed,
    this.minimumSize,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.color,
    this.enabled = true,
    this.margin = EdgeInsets.zero,
  }) : text = null,
       textStyle = null,
       viewStyle = ButtonViewStyle.base;

  @override
  Widget build(BuildContext context) {
    return switch (viewStyle) {
      ButtonViewStyle.base => buildButton(context),
      ButtonViewStyle.widthInfinity => SizedBox(width: double.infinity, child: buildButton(context)),
      ButtonViewStyle.expanded => Expanded(child: buildButton(context)),
    };
  }

  Widget buildButton(BuildContext context) {
    return Padding(
      padding: margin,
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          minimumSize: minimumSize ?? Size(84.w, 40.h),
          padding: padding ?? EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.w),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 20.r)),
          side: BorderSide(
            width: 1.r,
            color: enabled
                ? (borderColor ?? context.colors.borderSubtle)
                : (borderColor ?? context.colors.borderSubtle).withOpacity(0.5),
          ),
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
          shadowColor: Colors.transparent,
        ),
        child: child ?? textWidget(context),
      ),
    );
  }

  Widget textWidget(BuildContext context) {
    return Text(
      text!,
      style: (textStyle ?? context.textStyles.buttonMedium).copyWith(
        color: enabled ? context.colors.textDarkest : context.colors.textDarkest.withOpacity(0.5),
      ),
      textAlign: TextAlign.center,
    );
  }
}
