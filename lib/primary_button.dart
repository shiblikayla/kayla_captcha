import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.buttonText,
    this.prefixIcon,
    this.buttonColor,
    this.fontSize,
    this.buttonTextColor,
    this.fontWeight,
    this.buttonPadding,
    this.onTap,
    this.buttonIcon,
    this.buttonBorderColor,
    this.borderRadius,
    this.suffixIcon,
    this.textOverflow,
    this.isButtonLoading,
  });

  final Widget? buttonText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? buttonColor;
  final double? fontSize;
  final Color? buttonTextColor;
  final FontWeight? fontWeight;
  final EdgeInsets? buttonPadding;
  final Function? onTap;
  final Color? buttonBorderColor;
  final Widget? buttonIcon;
  final double? borderRadius;
  final TextOverflow? textOverflow;
  final bool? isButtonLoading;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Ink(
            padding: buttonPadding,
            decoration: BoxDecoration(
                color: buttonColor,
                border:
                    Border.all(color: buttonBorderColor ?? Colors.transparent),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                  borderRadius ?? 8,
                )),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefixIcon ?? const SizedBox(),
                prefixIcon != null
                    ? const SizedBox(
                        width: 4,
                      )
                    : const SizedBox(),
                buttonIcon ?? const SizedBox(),
                buttonIcon != null
                    ? const SizedBox(
                        width: 4,
                      )
                    : const SizedBox(),
                isButtonLoading == true
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ))
                    : buttonText ?? const SizedBox(),
              ],
            )),
      ),
    );
  }
}
