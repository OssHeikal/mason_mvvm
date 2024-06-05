import 'package:flutter/material.dart';
import 'package:gomla_plus/core/resources/gen/fonts.gen.dart';

import '../config/extensions/all_extensions.dart';
import '../config/theme/light_theme.dart';
import '../widgets/custom_input_field.dart';
import 'resources.dart';

class TextStylesManager {
  const TextStylesManager._();
  static TextStyle font = const TextStyle(fontFamily: FontFamily.teshrin);
}

class ShadowStyles {
  const ShadowStyles._();
  static List<BoxShadow> bottomSheetShadow = [
    BoxShadow(
      color: LightThemeColors.shadowBottomSheet,
      blurRadius: 32,
      offset: const Offset(4, 10),
      spreadRadius: 0,
    )
  ];

  static List<BoxShadow> cardShadow = [
    const BoxShadow(
      color: Color(0x23000000),
      blurRadius: 8,
      offset: Offset(0, 0),
      spreadRadius: 0,
    )
  ];

  static List<BoxShadow> tabBarShadow = [
    BoxShadow(
      blurStyle: BlurStyle.inner,
      color: Colors.black.withOpacity(0.12),
      blurRadius: 10,
      offset: const Offset(-1, -1),
      spreadRadius: 0,
    ),
    BoxShadow(
      blurStyle: BlurStyle.inner,
      color: Colors.black.withOpacity(0.12),
      blurRadius: 10,
      offset: const Offset(1, 1),
      spreadRadius: 0,
    )
  ];

  static List<BoxShadow> tileShadow = [
    const BoxShadow(
      color: Color(0x1E000000),
      blurRadius: 10,
      offset: Offset(0, 0),
      spreadRadius: 0,
    )
  ];
}

class GradientStyles {
  const GradientStyles._();
}

class InputDecorations {
  const InputDecorations._();

  static InputDecoration filled({
    String? hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isPassword = false,
    bool obscuredValue = true,
    bool smallSuffixIcon = false,
    Color fillColor = LightThemeColors.background,
    required ValueNotifier<bool> obscure,
  }) {
    return InputDecoration(
      filled: true,
      hintText: hint,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s16),
      hintStyle: TextStylesManager.font.regular.s16.ellipsis.setColor(LightThemeColors.hintText),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: BorderSide.none,
      ),
      prefixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
      suffixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
      prefixIcon: prefixIcon,
      suffixIcon: isPassword
          ? obscuredValue
              ? Icon(
                  Icons.visibility_outlined,
                  color: LightThemeColors.hintText,
                ).onTap(() => obscure.value = !obscuredValue)
              : Icon(
                  Icons.visibility_off_outlined,
                  color: LightThemeColors.hintText,
                ).onTap(() => obscure.value = !obscuredValue)
          : suffixIcon,
    );
  }

  static InputDecoration outlined({
    String? hint,
    String? label,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isPassword = false,
    bool obscuredValue = true,
    bool smallSuffixIcon = false,
    Color fillColor = LightThemeColors.background,
    Color? borderColor,
    Color? focusedBorderColor,
    bool isDense = false,
    required ValueNotifier<bool> obscure,
    BorderRadius? borderRadius,
  }) {
    return InputDecoration(
      filled: true,
      hintText: hint,
      labelText: label,
      isDense: isDense,
      labelStyle: TextStylesManager.font.regular.s12.ellipsis.setColor(LightThemeColors.unActive),
      fillColor: LightThemeColors.background,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s10),
      hintStyle: TextStylesManager.font.regular.s14.ellipsis.setColor(LightThemeColors.unActive),
      border: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: BorderSide(color: LightThemeColors.inputFieldBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: BorderSide(color: focusedBorderColor ?? LightThemeColors.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: BorderSide(color: borderColor ?? LightThemeColors.inputFieldBorder),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: const BorderSide(color: LightThemeColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: const BorderSide(color: LightThemeColors.error),
      ),
      prefixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
      suffixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
      prefixIcon: prefixIcon,
      suffixIcon: isPassword
          ? obscuredValue
              ? Assets.icons.eyeOn.path
                  .toSvg(color: LightThemeColors.hintText)
                  .onTap(() => obscure.value = !obscuredValue)
              : Assets.icons.eyeOff.path
                  .toSvg(color: LightThemeColors.hintText)
                  .onTap(() => obscure.value = !obscuredValue)
          : suffixIcon,
    );
  }

  static InputDecoration underlined({
    String? hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isPassword = false,
    bool obscuredValue = true,
    bool smallSuffixIcon = false,
    Color fillColor = LightThemeColors.background,
    required ValueNotifier<bool> obscure,
  }) {
    return InputDecoration(
      filled: true,
      hintText: hint,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s16),
      hintStyle: TextStylesManager.font.regular.s16.ellipsis.setColor(LightThemeColors.hintText),
      border: UnderlineInputBorder(borderSide: BorderSide(color: LightThemeColors.inputFieldBorder)),
      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: LightThemeColors.primary)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: LightThemeColors.inputFieldBorder)),
      errorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: LightThemeColors.error)),
      focusedErrorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: LightThemeColors.error)),
      prefixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
      suffixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
      prefixIcon: prefixIcon,
      suffixIcon: isPassword
          ? obscuredValue
              ? Icon(
                  Icons.visibility_outlined,
                  color: LightThemeColors.hintText,
                ).onTap(() => obscure.value = !obscuredValue)
              : Icon(
                  Icons.visibility_off_outlined,
                  color: LightThemeColors.hintText,
                ).onTap(() => obscure.value = !obscuredValue)
          : suffixIcon,
    );
  }

  static InputDecoration buildDecoration({
    required DecorationType decorationType,
    required ValueNotifier<bool> obscure,
    bool? obscureValue,
    String? hint,
    String? label,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isPassword = false,
    bool obscuredValue = true,
    bool smallSuffixIcon = false,
    Color? borderColor,
    Color? focusedBorderColor,
    bool isDense = false,
    Color fillColor = LightThemeColors.background,
    BorderRadius? borderRadius,
  }) {
    switch (decorationType) {
      case DecorationType.underlined:
        return InputDecorations.underlined(
          hint: hint,
          obscure: obscure,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          isPassword: isPassword,
          fillColor: fillColor,
          obscuredValue: obscuredValue,
          smallSuffixIcon: smallSuffixIcon,
        );
      case DecorationType.outlined:
        return InputDecorations.outlined(
          hint: hint,
          label: label,
          obscure: obscure,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          isPassword: isPassword,
          obscuredValue: obscuredValue,
          smallSuffixIcon: smallSuffixIcon,
          fillColor: fillColor,
          borderColor: borderColor,
          isDense: isDense,
          focusedBorderColor: focusedBorderColor,
          borderRadius: borderRadius,
        );
      case DecorationType.filled:
        return InputDecorations.filled(
          hint: hint,
          fillColor: fillColor,
          obscure: obscure,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          isPassword: isPassword,
          obscuredValue: obscuredValue,
          smallSuffixIcon: smallSuffixIcon,
        );
    }
  }
}
