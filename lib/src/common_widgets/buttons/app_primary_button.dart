import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

enum ButtonViewStyle { base, widthInfinity, expanded }

class AppPrimaryButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? minWidth;
  final TextStyle? textStyle;
  final Widget? child;
  final VoidCallback? onPressed;
  final ButtonViewStyle viewStyle;
  final double? horizontalPadding;
  final double? borderRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool enabled;
  final bool ignoring;
  final EdgeInsets margin;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.horizontalPadding,
    this.color,
    this.minWidth,
    this.textStyle,
    this.borderRadius,
    this.materialTapTargetSize,
    this.enabled = true,
    this.ignoring = false,
    this.margin = EdgeInsets.zero,
  }) : child = null,
       viewStyle = ButtonViewStyle.base;

  const AppPrimaryButton.infinity({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.minWidth,
    this.textStyle,
    this.borderRadius,
    this.materialTapTargetSize,
    this.enabled = true,
    this.ignoring = false,
    this.margin = EdgeInsets.zero,
  }) : child = null,
       horizontalPadding = null,
       viewStyle = ButtonViewStyle.widthInfinity;

  const AppPrimaryButton.expanded({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.minWidth,
    this.textStyle,
    this.borderRadius,
    this.materialTapTargetSize,
    this.enabled = true,
    this.ignoring = false,
    this.margin = EdgeInsets.zero,
  }) : child = null,
       horizontalPadding = null,
       viewStyle = ButtonViewStyle.expanded;

  const AppPrimaryButton.build({
    super.key,
    required this.child,
    required this.onPressed,
    required this.horizontalPadding,
    this.color,
    this.minWidth,
    this.borderRadius,
    this.materialTapTargetSize,
    this.enabled = true,
    this.ignoring = false,
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
    return IgnorePointer(
      ignoring: ignoring,
      child: Padding(
        padding: margin,
        child: MaterialButton(
          color: enabled
              ? (color ?? context.colors.primaryLight)
              : (color ?? context.colors.primaryLight).withValues(alpha: 0.5),
          minWidth: minWidth ?? 0,
          materialTapTargetSize: materialTapTargetSize,
          onPressed: () {
            if (enabled) onPressed?.call();
          },
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 12.rsp, horizontal: horizontalPadding ?? 16.rw),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 12.rr)),
          child: child ?? textWidget(context),
        ),
      ),
    );
  }

  Widget textWidget(BuildContext context) {
    return Text(
      text!,
      style: (textStyle ?? context.textStyles.buttonMedium).copyWith(
        color: enabled ? context.colors.textDarkest : context.colors.textDarkest.withValues(alpha: 0.5),
      ),
      textAlign: TextAlign.center,
    );
  }
}
