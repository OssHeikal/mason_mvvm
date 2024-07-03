import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/config/extensions/all_extensions.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/custom_arrow_back.dart';
import '../../../../../core/widgets/custom_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    this.svgPath,
    this.title,
    this.message,
    this.enableBack = false,
    this.onRetry,
  });
  final bool enableBack;
  final String? svgPath;
  final String? title;
  final String? message;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: context.statusBarHeight + AppSize.s6.h,
            left: context.isArabic ? null : AppSize.screenPadding,
            right: context.isArabic ? AppSize.screenPadding : null,
            child: const CustomArrowBack(),
          ).buildWhen(enableBack),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(svgPath ?? Assets.icons.warning.path),
              AppSize.s24.verticalSpace,
              Text(
                message ?? LocaleKeys.dio_messages_no_internet_error.tr(),
                textAlign: TextAlign.center,
                style: context.bodyMedium.s18.medium,
              ),
              AppSize.s45.verticalSpace,
              if (onRetry != null) CustomButton(onPressed: onRetry!, label: LocaleKeys.retry.tr()),
            ],
          ).paddingHorizontal(AppSize.s55.w).center(),
        ],
      ),
    );
  }
}
