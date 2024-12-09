import 'package:evently/core/config/extensions/all_extensions.dart';
import 'package:evently/core/resources/resources.dart';
import 'package:flutter/material.dart';

class CloseIconButton extends StatelessWidget {
  const CloseIconButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Assets.icons.close
        .svg(colorFilter: context.iconColorDisabled.colorFilter, height: 20)
        .center()
        .withSize(12, 12)
        .onTap(onPressed);
  }
}
