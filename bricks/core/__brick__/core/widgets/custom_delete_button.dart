import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/config/extensions/all_extensions.dart';
import 'package:evently/core/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

import '../resources/resources.dart';

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton({super.key, this.onDeleted, this.deleteLabel, this.title});

  final void Function()? onDeleted;
  final String? deleteLabel;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Assets.icons.trash.svg(colorFilter: context.errorColor.colorFilter, height: 16).paddingAll(4).onTap(() {
      context.showDialog(
        CustomDialog(
          isDestructive: true,
          onConfirm: onDeleted,
          title: title ?? LocaleKeys.actions_delete.tr(),
          confirmLabel: deleteLabel ?? LocaleKeys.actions_delete.tr(),
        ),
      );
    });
  }
}
