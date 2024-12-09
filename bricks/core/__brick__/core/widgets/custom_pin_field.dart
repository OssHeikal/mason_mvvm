import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/config/theme/light_theme.dart';
import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';

class CustomPinInputField extends StatelessWidget {
  const CustomPinInputField({
    super.key,
    this.onCompleted,
    required this.controller,
  });
  final TextEditingController controller;
  final void Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        controller: controller,
        length: 4,
        appContext: context,
        showCursor: false,
        obscureText: false,
        enableActiveFill: true,
        autoFocus: true,
        autoDismissKeyboard: true,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        backgroundColor: context.scaffoldBackgroundColor,
        //* otp functionality *//
        onCompleted: onCompleted,
        //* text style *//
        textStyle: context.bodyLarge.s20.semiBold,
        //* pin box properties *//
        pinTheme: PinTheme.defaults(
          fieldHeight: 64.sp,
          fieldWidth: 64.sp,
          shape: PinCodeFieldShape.box,
          activeFillColor: context.scaffoldBackgroundColor,
          inactiveFillColor: context.scaffoldBackgroundColor,
          selectedFillColor: context.scaffoldBackgroundColor,
          //* border properties *//
          borderWidth: 1.sp,
          activeBorderWidth: 1.sp,
          selectedBorderWidth: 1.sp,
          inactiveBorderWidth: 1.sp,
          selectedColor: context.bodyLarge.color!,
          activeColor: context.bodyLarge.color!,
          inactiveColor: LightThemeColors.inputFieldBorder,
          borderRadius: AppSize.inputBorderRadius.borderRadius,
        ),
      ).paddingHorizontal(20.w),
    );
  }
}
