// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/theme/light_theme.dart';
import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final bool enableBorder;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.backgroundColor,
    this.enableBorder = false,
    this.borderColor = LightThemeColors.primary,
    this.borderRadius = AppSize.mainRadius,
  });

  factory CustomButton.icon({
    double? fontSize,
    Color? fontColor,
    Color? backgroundColor,
    Color iconColor = Colors.white,
    bool centerIcon = true,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return _CustomButtonWithIcon(
      fontSize: fontSize,
      fontColor: fontColor,
      backgroundColor: backgroundColor,
      centerIcon: centerIcon,
      iconColor: iconColor,
      icon: icon,
      label: label,
      onPressed: onPressed,
    );
  }

  factory CustomButton.svg({
    Widget? child,
    double? fontSize,
    Color? fontColor,
    FontWeight fontWeight = FontWeight.w500,
    Color? backgroundColor,
    double svgAngle = AppSize.s0,
    Color? svgColor,
    bool centerIcon = true,
    bool enableBorder = false,
    double borderRadius = AppSize.s14,
    Color borderColor = LightThemeColors.primary,
    required String svgPath,
    required String label,
    required VoidCallback onPressed,
  }) {
    return _CustomButtonWithSvg(
      fontSize: fontSize,
      fontColor: fontColor,
      fontWeight: fontWeight,
      centerIcon: centerIcon,
      enableBorder: enableBorder,
      borderRadius: borderRadius,
      borderColor: borderColor,
      svgAngle: svgAngle,
      backgroundColor: backgroundColor,
      svgColor: svgColor,
      svgPath: svgPath,
      label: label,
      onPressed: onPressed,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: fontColor,
        backgroundColor: backgroundColor,
        shape: const StadiumBorder(),
        side: enableBorder ? BorderSide(color: borderColor, width: 2.r) : BorderSide.none,
      ),
      child: Text(label, style: TextStyle(fontSize: fontSize, fontWeight: fontWeight)).paddingTop(AppSize.s0),
    );
  }
}

class _CustomButtonWithIcon extends CustomButton {
  final IconData icon;
  final Color iconColor;
  final bool centerIcon;
  const _CustomButtonWithIcon({
    super.fontSize,
    super.fontColor,
    super.backgroundColor,
    this.centerIcon = true,
    this.iconColor = Colors.white,
    required this.icon,
    required super.label,
    required super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(foregroundColor: fontColor, backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: centerIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 22),
                AppSize.s8.horizontalSpace,
                Text(label, style: context.textTheme.titleSmall!.copyWith(color: fontColor)),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSize.s24.horizontalSpace,
                Text(label, style: context.textTheme.titleSmall!.copyWith(color: fontColor)),
                Icon(icon, size: 20),
              ],
            ).paddingHorizontal(AppSize.s20),
    );
  }
}

class _CustomButtonWithSvg extends CustomButton {
  final Widget? child;
  final String svgPath;
  final Color? svgColor;
  final double svgAngle;
  final bool centerIcon;
  const _CustomButtonWithSvg({
    super.fontSize,
    super.enableBorder,
    FontWeight super.fontWeight = FontWeight.w500,
    super.fontColor,
    super.backgroundColor,
    super.borderRadius,
    super.borderColor,
    this.child,
    this.centerIcon = true,
    this.svgColor,
    this.svgAngle = AppSize.s0,
    required this.svgPath,
    required super.label,
    required super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: fontColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        side: enableBorder ? BorderSide(color: borderColor, width: 1) : BorderSide.none,
      ),
      onPressed: onPressed,
      child: centerIcon
          ? child ??
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(svgPath, color: svgColor).rotate(angle: svgAngle),
                  Text(label, style: TextStyle(fontSize: fontSize, fontWeight: fontWeight)),
                ],
              )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: TextStyle(fontSize: fontSize, fontWeight: fontWeight)),
                SvgPicture.asset(svgPath, color: svgColor).rotate(angle: svgAngle)
              ],
            ).paddingHorizontal(AppSize.s20),
    );
  }
}
