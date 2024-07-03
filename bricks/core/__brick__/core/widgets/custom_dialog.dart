import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../config/extensions/all_extensions.dart';
import '../../resources/resources.dart';
import 'custom_button.dart';
import 'custom_close_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    this.confirmLabel,
    this.cancelLabel,
    this.onConfirm,
    this.onCancel,
    this.confirmColor,
    this.showConfirm = true,
  });
  final String title;
  final String? confirmLabel;
  final String? cancelLabel;
  final void Function()? onConfirm;
  final void Function()? onCancel;
  final Color? confirmColor;
  final bool showConfirm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomCloseButton(center: false),
        AppSize.s18.verticalSpace,
        Text(title, style: context.titleMedium.medium.s16),
        AppSize.s32.verticalSpace,
        if (showConfirm) ...[
          CustomButton(
            backgroundColor: confirmColor,
            label: confirmLabel ?? LocaleKeys.confirm.tr(),
            onPressed: () {
              context.pop();
              onConfirm?.call();
            },
          ),
          AppSize.s16.verticalSpace,
        ],
        CustomButton.outlined(
          label: cancelLabel ?? LocaleKeys.cancel.tr(),
          onPressed: () {
            context.pop();
            onCancel?.call();
          },
        )
      ],
    )
        .setContainerToView(
          padding: AppSize.screenPadding,
          color: context.scaffoldBackgroundColor,
          radius: AppSize.s6.r,
        )
        .paddingHorizontal(AppSize.s36);
  }
}
