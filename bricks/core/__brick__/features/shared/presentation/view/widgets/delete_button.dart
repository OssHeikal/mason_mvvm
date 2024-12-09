import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/extensions/all_extensions.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/utils/overlay_utils.dart';
import '../../../../../core/widgets/custom_dialog.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key, required this.onDeleted, required this.title});

  final void Function() onDeleted;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Assets.icons.trash
        .svg(colorFilter: context.iconColor.colorFilter, height: AppSize.iconNormal)
        .setBorder(radius: AppSize.s4.r, padding: AppSize.s6.r, color: context.primaryContainerColor)
        .onTap(() {
      OverlayUtils.showCustomDialog(
        context: context,
        child: CustomDialog(
          confirmLabel: LocaleKeys.actions_clear.tr(),
          onConfirm: onDeleted,
          confirmColor: context.errorColor,
          title: title,
        ),
      );
    }, borderRadius: AppSize.s4.r.borderRadius).paddingEnd(AppSize.screenPadding);
  }
}
