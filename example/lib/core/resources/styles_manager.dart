import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/extensions/all_extensions.dart';
import '../config/theme/light_theme.dart';
import '../widgets/custom_input_field.dart';
import 'resources.dart';


class TextStylesManager {
  const TextStylesManager._();
  static TextStyle cairo = GoogleFonts.cairo();
  static TextStyle cairoRegular = GoogleFonts.cairo().regular;
  static TextStyle cairoMedium = GoogleFonts.cairo().medium;
  static TextStyle cairoSemiBold = GoogleFonts.cairo().semiBold;
  static TextStyle cairoBold = GoogleFonts.cairo().bold;
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
    BoxShadow(
      color: LightThemeColors.shadow,
      blurRadius: 8,
      offset: const Offset(0, 1),
      spreadRadius: 0,
    )
  ];
}

class GradientStyles {
  const GradientStyles._();

  static LinearGradient primaryGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: LightThemeColors.gradientPrimary,
  );
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
      hintStyle: TextStylesManager.cairo.regular.s16.ellipsis.setColor(LightThemeColors.hintText),
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
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isPassword = false,
    bool obscuredValue = true,
    bool smallSuffixIcon = false,
    required ValueNotifier<bool> obscure,
  }) {
    return InputDecoration(
      filled: true,
      hintText: hint,
      fillColor: LightThemeColors.background,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s16),
      hintStyle: TextStylesManager.cairo.regular.s16.ellipsis.setColor(LightThemeColors.hintText),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: BorderSide(color: LightThemeColors.inputFieldBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: const BorderSide(color: LightThemeColors.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: BorderSide(color: LightThemeColors.inputFieldBorder),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: const BorderSide(color: LightThemeColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
        borderSide: const BorderSide(color: LightThemeColors.error),
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
      hintStyle: TextStylesManager.cairo.regular.s16.ellipsis.setColor(LightThemeColors.hintText),
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
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isPassword = false,
    bool obscuredValue = true,
    bool smallSuffixIcon = false,
    Color fillColor = LightThemeColors.background,
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
          obscure: obscure,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          isPassword: isPassword,
          obscuredValue: obscuredValue,
          smallSuffixIcon: smallSuffixIcon,
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
