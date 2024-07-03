import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/config/theme/light_theme.dart';
import '../../config/extensions/all_extensions.dart';
import '../../resources/resources.dart';

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
        textStyle: context.textTheme.displaySmall,
        //* pin box properties *//
        pinTheme: PinTheme.defaults(
          fieldHeight: AppSize.s65.sp,
          fieldWidth: AppSize.s65.sp,
          shape: PinCodeFieldShape.box,
          activeFillColor: context.scaffoldBackgroundColor,
          inactiveFillColor: context.scaffoldBackgroundColor,
          selectedFillColor: context.primaryCardColor,
          //* border properties *//
          borderWidth: AppSize.s1_5.sp,
          activeBorderWidth: AppSize.s1_5.sp,
          selectedBorderWidth: AppSize.s1_5.sp,
          inactiveBorderWidth: AppSize.s1_5.sp,
          selectedColor: context.primaryColor,
          activeColor: context.primaryColor,
          inactiveColor: LightThemeColors.inputFieldBorder,
          borderRadius: BorderRadius.circular(AppSize.s16.r),
        ),
      ).paddingHorizontal(AppSize.s20.w),
    );
  }
}
