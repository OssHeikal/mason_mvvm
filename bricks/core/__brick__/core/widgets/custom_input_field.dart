import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habl_ghaseel/core/config/extensions/all_extensions.dart';

import '../../config/theme/light_theme.dart';
import '../../resources/resources.dart';

enum DecorationType { underlined, outlined, filled }

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    required this.decorationType,
    this.hasDropDown,
    this.text,
    required this.textInputAction,
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
    required this.keyboardType,
    required this.isPassword,
    required this.enabled,
    required this.readOnly,
    required this.borderEnabled,
    required this.autoFocus,
    required this.smallSuffixIcon,
    required this.error,
    required this.isDense,
    required this.maxLines,
    this.borderRadius,
    this.fillColor,
    this.onChanged,
    this.label,
    this.title,
    this.autovalidateMode,
    this.contentPadding,
    required this.textAlign,
    this.hintTextStyle,
    this.labelStyle,
    this.textStyle,
    this.hintSize,
    required this.hasPoint,
    this.onTap,
    this.onEditingComplete,
    this.inputDecoration,
    this.focusNode,
    this.initialValue,
    this.background,
    this.gradientBorder,
  });

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
  final Color? background;
  final Gradient? gradientBorder;

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
    this.readOnly = false,
    this.borderEnabled = true,
    this.autoFocus = false,
    this.smallSuffixIcon = false,
    this.error = false,
    this.isDense = false,
    this.maxLines = 1,
    this.borderRadius,
    this.fillColor,
    this.onChanged,
    this.label,
    this.title,
    this.autovalidateMode,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.hintTextStyle,
    this.labelStyle,
    this.textStyle,
    this.hintSize,
    this.hasPoint = false,
    this.onTap,
    this.onEditingComplete,
    this.inputDecoration,
    this.focusNode,
    this.initialValue,
    this.background,
    this.gradientBorder,
  }) : decorationType = DecorationType.underlined;

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
    this.readOnly = false,
    this.borderEnabled = true,
    this.autoFocus = false,
    this.smallSuffixIcon = false,
    this.error = false,
    this.isDense = false,
    this.maxLines = 1,
    this.borderRadius,
    this.fillColor,
    this.onChanged,
    this.label,
    this.title,
    this.autovalidateMode,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.hintTextStyle,
    this.labelStyle,
    this.textStyle,
    this.hintSize,
    this.hasPoint = false,
    this.onTap,
    this.onEditingComplete,
    this.inputDecoration,
    this.focusNode,
    this.initialValue,
    this.background,
    this.gradientBorder,
  }) : decorationType = DecorationType.filled;

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
    this.readOnly = false,
    this.borderEnabled = true,
    this.autoFocus = false,
    this.smallSuffixIcon = false,
    this.error = false,
    this.isDense = false,
    this.maxLines = 1,
    this.borderRadius,
    this.fillColor,
    this.onChanged,
    this.label,
    this.title,
    this.autovalidateMode,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.hintTextStyle,
    this.labelStyle,
    this.textStyle,
    this.hintSize,
    this.hasPoint = false,
    this.onTap,
    this.onEditingComplete,
    this.inputDecoration,
    this.focusNode,
    this.initialValue,
    this.background,
    this.gradientBorder,
  }) : decorationType = DecorationType.outlined;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  final ValueNotifier<bool> obscure = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obscure,
      builder: (context, obscuredValue, _) {
        return TextFormField(
          controller: widget.controller,
          initialValue: widget.initialValue,
          validator: widget.validator,
          style: context.textTheme.bodyLarge?.regular.s12,
          onFieldSubmitted: widget.onSubmitted,
          textInputAction: widget.textInputAction,
          cursorErrorColor: context.errorColor,
          cursorColor: context.primaryColor,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          autofocus: widget.autoFocus,
          obscureText: widget.isPassword && obscuredValue,
          enableSuggestions: widget.isPassword,
          autocorrect: widget.isPassword,
          autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
          textAlign: widget.textAlign,
          onEditingComplete: widget.onEditingComplete,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          inputFormatters: _getInputFormatters(),
          decoration: InputDecoration(
            hintText: widget.hint,
            labelText: widget.label,
            isDense: widget.isDense,
            fillColor: _getBackgroundColor(),
            constraints: widget.height != null ? BoxConstraints(maxHeight: widget.height!) : null,
            labelStyle: TextStylesManager.font.regular.s12.ellipsis.setColor(LightThemeColors.unActive),
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s10),
            hintStyle: TextStylesManager.font.regular.s12.ellipsis.setColor(LightThemeColors.hintText),
            border: _buildInputBorder(borderColor: widget.borderColor),
            focusedBorder: _buildInputBorder(borderColor: widget.borderColor ?? context.primaryColor),
            enabledBorder: _buildInputBorder(borderColor: widget.borderColor),
            errorBorder: _buildInputBorder(borderColor: context.errorColor),
            focusedErrorBorder: _buildInputBorder(borderColor: context.errorColor),
            prefixIconConstraints: widget.smallSuffixIcon ? BoxConstraints(maxWidth: AppSize.iconNormal.sp) : null,
            suffixIconConstraints: widget.smallSuffixIcon ? BoxConstraints(maxWidth: AppSize.iconNormal.sp) : null,
            prefixIcon: widget.prefixIcon,
            suffixIcon: _buildSuffixIcon(obscuredValue),
          ),
        ).setTitle(context, title: widget.title, titleStyle: widget.labelStyle ?? context.titleMedium.s14.medium);
      },
    );
  }

  InputBorder _buildInputBorder({Color? borderColor}) {
    switch (widget.decorationType) {
      case DecorationType.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? LightThemeColors.inputFieldBorder),
        );
      case DecorationType.outlined:
        return OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(AppSize.inputBorderRadius).r,
          borderSide: BorderSide(color: widget.borderColor ?? LightThemeColors.inputFieldBorder),
        );
      case DecorationType.filled:
        return OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(AppSize.inputBorderRadius).r,
          borderSide: BorderSide.none,
        );
    }
  }

  Color _getBackgroundColor() {
    switch (widget.decorationType) {
      case DecorationType.underlined:
        return widget.background ?? context.scaffoldBackgroundColor;
      case DecorationType.outlined:
        return widget.background ?? context.scaffoldBackgroundColor;
      case DecorationType.filled:
        return widget.background ?? LightThemeColors.background;
    }
  }

  Widget? _buildSuffixIcon(bool obscuredValue) {
    return widget.isPassword
        ? obscuredValue
            ? Assets.icons.eyeOn.path
                .toSvg(color: LightThemeColors.hintText)
                .onTap(() => obscure.value = !obscuredValue)
            : Assets.icons.eyeOff.path
                .toSvg(color: LightThemeColors.hintText)
                .onTap(() => obscure.value = !obscuredValue)
        : widget.suffixIcon;
  }

  List<TextInputFormatter>? _getInputFormatters() {
    if (widget.keyboardType == TextInputType.number) {
      return !widget.hasPoint
          ? [FilteringTextInputFormatter.digitsOnly]
          : [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))];
    }
    return null;
  }
}
