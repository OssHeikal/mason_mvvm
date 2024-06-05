import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/theme/light_theme.dart';
import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';

enum DecorationType { underlined, outlined, filled }

class CustomInputField extends StatelessWidget {
  final DecorationType decorationType;
  final bool? hasDropDown;
  final String? text;
  final TextInputAction textInputAction;
  final Color? borderColor;
  final double? width;
  final Function(String?)? onSubmitted;
  final double? height;
  final String? hint;
  final Color? hintColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool enabled, readOnly, borderEnabled;
  final bool autoFocus;
  final bool smallSuffixIcon;
  final bool error;
  final bool isDense;
  final int maxLines;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final Function(String)? onChanged;
  final String? label, title;
  final AutovalidateMode? autovalidateMode;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign textAlign;
  final TextStyle? hintTextStyle;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final double? hintSize;
  final bool hasPoint;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final InputDecoration? inputDecoration;
  final FocusNode? focusNode;
  final String? initialValue;

  const CustomInputField({
    super.key,
    this.hasDropDown = false,
    this.text,
    this.textInputAction = TextInputAction.done,
    this.borderColor,
    this.width,
    this.onSubmitted,
    this.height,
    this.hint,
    this.hintColor,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
    this.autoFocus = false,
    this.error = false,
    this.smallSuffixIcon = false,
    this.maxLines = 1,
    this.borderRadius,
    this.fillColor = LightThemeColors.background,
    this.onChanged,
    this.label,
    this.title,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.hintTextStyle,
    this.labelStyle,
    this.textStyle,
    this.hintSize,
    this.hasPoint = false,
    this.onTap,
    this.inputDecoration,
    this.readOnly = false,
    this.borderEnabled = false,
    this.focusNode,
    this.onEditingComplete,
    this.isDense = false,
    this.initialValue,
  }) : decorationType = DecorationType.outlined;

  const CustomInputField.underlined({
    super.key,
    this.hasDropDown = false,
    this.text,
    this.textInputAction = TextInputAction.done,
    this.borderColor,
    this.width,
    this.onSubmitted,
    this.height,
    this.hint,
    this.hintColor,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
    this.autoFocus = false,
    this.error = false,
    this.smallSuffixIcon = false,
    this.maxLines = 1,
    this.borderRadius,
    this.fillColor = LightThemeColors.background,
    this.onChanged,
    this.label,
    this.title,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.hintTextStyle,
    this.labelStyle,
    this.textStyle,
    this.hintSize,
    this.hasPoint = false,
    this.onTap,
    this.inputDecoration,
    this.readOnly = false,
    this.borderEnabled = false,
    this.focusNode,
    this.isDense = false,
    this.onEditingComplete,
    this.initialValue,
  }) : decorationType = DecorationType.underlined;

  const CustomInputField.outlined({
    super.key,
    this.hasDropDown = false,
    this.text,
    this.textInputAction = TextInputAction.done,
    this.borderColor,
    this.width,
    this.onSubmitted,
    this.height,
    this.hint,
    this.hintColor,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
    this.autoFocus = false,
    this.error = false,
    this.smallSuffixIcon = false,
    this.maxLines = 1,
    this.borderRadius,
    this.fillColor = LightThemeColors.background,
    this.onChanged,
    this.label,
    this.title,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.hintTextStyle,
    this.labelStyle,
    this.textStyle,
    this.hintSize,
    this.hasPoint = false,
    this.onTap,
    this.inputDecoration,
    this.borderEnabled = false,
    this.readOnly = false,
    this.focusNode,
    this.isDense = false,
    this.onEditingComplete,
    this.initialValue,
  }) : decorationType = DecorationType.outlined;

  const CustomInputField.filled({
    super.key,
    this.hasDropDown = false,
    this.text,
    this.textInputAction = TextInputAction.done,
    this.borderColor,
    this.width,
    this.onSubmitted,
    this.height,
    this.hint,
    this.hintColor,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
    this.autoFocus = false,
    this.error = false,
    this.smallSuffixIcon = false,
    this.maxLines = 1,
    this.borderRadius,
    this.fillColor,
    this.onChanged,
    this.label,
    this.title,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.hintTextStyle,
    this.labelStyle,
    this.textStyle,
    this.hintSize,
    this.hasPoint = false,
    this.onTap,
    this.inputDecoration,
    this.borderEnabled = false,
    this.readOnly = false,
    this.focusNode,
    this.isDense = false,
    this.onEditingComplete,
    this.initialValue,
  }) : decorationType = DecorationType.filled;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscure = ValueNotifier(true);
    return ValueListenableBuilder(
      valueListenable: obscure,
      builder: (context, obscuredValue, _) {
        return TextFormField(
          controller: controller,
          initialValue: initialValue,
          validator: validator,
          style: context.textTheme.titleMedium?.regular.s14,
          onFieldSubmitted: onSubmitted,
          textInputAction: textInputAction,
          cursorErrorColor: context.errorColor,
          cursorColor: context.primaryColor,
          enabled: enabled,
          readOnly: readOnly,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: onChanged,
          autofocus: autoFocus,
          obscureText: isPassword && obscuredValue,
          enableSuggestions: isPassword,
          autocorrect: isPassword,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.always,
          textAlign: textAlign,
          onEditingComplete: onEditingComplete,
          focusNode: focusNode,
          onTap: () {
            if (controller != null && controller!.text.isEmpty) {
              final lastSelectionPosition = TextSelection.fromPosition(
                TextPosition(offset: controller!.text.length - 1),
              );

              final afterLastSelectionPosition = TextSelection.fromPosition(
                TextPosition(offset: controller!.text.length),
              );

              if (controller!.selection == lastSelectionPosition) {
                controller!.selection = afterLastSelectionPosition;
              }
            }
            onTap?.call();
          },
          inputFormatters: keyboardType == TextInputType.number
              ? !hasPoint
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]
              : null,
          decoration: InputDecorations.buildDecoration(
            decorationType: decorationType,
            hint: hint,
            label: label,
            isDense: isDense,
            obscure: obscure,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            isPassword: isPassword,
            fillColor: fillColor ?? context.scaffoldBackgroundColor,
            obscuredValue: obscuredValue,
            smallSuffixIcon: smallSuffixIcon,
            borderRadius: borderRadius,
            focusedBorderColor: !borderEnabled ? borderColor ?? context.inputFieldBorderColor : context.primaryColor,
            borderColor: !borderEnabled
                ? borderColor
                : (controller == null || controller!.text.isEmpty
                    ? context.inputFieldBorderColor
                    : context.primaryColor),
          ),
        ).setTitle(context, title: title, titleStyle: labelStyle ?? context.titleMedium!.s14.medium);
      },
    );
  }
}
