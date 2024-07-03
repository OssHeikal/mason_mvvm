import 'dart:ui' as ui;
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/light_theme.dart';
import '../../config/extensions/all_extensions.dart';
import '../../resources/resources.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController? controller;
  final double? fontSize;
  final ValueChanged<String> onChangedCode;
  final bool readOnly;
  final void Function()? onTap;

  const CustomPhoneField({
    super.key,
    this.onTap,
    this.fontSize,
    this.readOnly = false,
    this.controller,
    required this.onChangedCode,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: LightThemeColors.inputFieldBorder, width: AppSize.s1)),
        ),
        child: Row(
          children: [
            CountryCodePicker(
              showFlagDialog: true,
              showCountryOnly: false,
              padding: EdgeInsets.zero,
              flagWidth: AppSize.s24.sp,
              showOnlyCountryWhenClosed: false,
              favorite: LocalizationConstants.favCountry,
              initialSelection: LocalizationConstants.initialSelection,
              textStyle: context.titleMedium.setFontSize(fontSize ?? FontSize.s16),
              flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s3.r)),
              onChanged: (e) {
                if (e.dialCode != null) {
                  onChangedCode(e.dialCode.toString());
                }
              },
            ),
            TextFormField(
              readOnly: readOnly,
              keyboardType: TextInputType.phone,
              controller: controller,
              onTap: onTap,
              style: context.titleMedium.setFontSize(fontSize ?? FontSize.s24),
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                hintText: 'XXXXXXXXXX',
                hintStyle: context.hintTextStyle.setFontSize(fontSize ?? FontSize.s16),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: 0),
              ),
            ).expand(),
            Assets.icons.close.path
                .toSvg(height: AppSize.s12.sp, width: AppSize.s12.sp)
                .onTap(() => controller!.clear())
                .withSize(AppSize.s20.w, AppSize.s40.h),
          ],
        ),
      ),
    );
  }
}
