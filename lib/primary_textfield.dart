// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextfield extends StatelessWidget {
  PrimaryTextfield({
    super.key,
    this.isfilled,
    this.filledColor,
    this.borderColor,
    this.prefixIcon,
    required this.onUserInteraction,
    this.suffixIcon,
    this.hintText,
    this.focusBorderColor,
    this.labelText,
    this.hintFontSize,
    this.crossIcon,
    this.controller,
    this.keyboardType,
    this.inputformatters,
    this.validator,
    this.onTap,
    this.onChanged,
    this.readOnly,
    this.fontWeight,
    this.maxLines,
    this.obscureText,
    this.focusNode,
    this.contentPadding,
    this.style,
    this.autoFocus,
    this.maxLength,
    this.labelColor,
    required this.themeColor,
    this.textCapitalization,
    this.hintColor,
    this.controllerFontsize,
    this.labelFontSize,
  });

  bool? isfilled = false;
  final Color? borderColor;
  final bool? onUserInteraction;
  final bool? obscureText;
  final Color? filledColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final Color? focusBorderColor;
  final String? labelText;
  final double? hintFontSize;
  final Icon? crossIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputformatters;
  final String? Function(String?)? validator;
  final Function? onTap;
  final bool? readOnly;
  final int? maxLines;
  final FontWeight? fontWeight;
  final Function(String value)? onChanged;
  FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final TextStyle? style;
  final bool? autoFocus;
  final int? maxLength;
  final Color? labelColor;
  final TextCapitalization? textCapitalization;
  final Color? hintColor;
  final double? controllerFontsize;
  final double? labelFontSize;
  final Color themeColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      maxLength: maxLength,
      autovalidateMode: onUserInteraction == true
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      style: TextStyle(fontSize: controllerFontsize ?? 12),
      obscuringCharacter: '*',
      autofocus: autoFocus == null ? false : true,
      focusNode: focusNode,
      scrollPadding: EdgeInsets.all(0),
      obscureText: obscureText == null ? false : obscureText!,
      maxLines: maxLines,
      readOnly: readOnly ?? false,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputformatters,
      controller: controller,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: prefixIcon,
              ),
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: suffixIcon,
              ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: hintFontSize,
            fontFamily: 'Jost',
            fontWeight: fontWeight,
            color: hintColor),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: labelFontSize ?? 14,
          fontWeight: FontWeight.w400,
          color: labelColor ?? Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? themeColor),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor ?? themeColor)),
        fillColor: filledColor,
        filled: isfilled,
        contentPadding: contentPadding,
      ),
    );
  }
}
