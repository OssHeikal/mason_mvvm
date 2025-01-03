import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';

class PasteIconButton extends StatelessWidget {
  const PasteIconButton({super.key, this.onPressed});
  final void Function(String)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Assets.icons.clipboard
        .svg(colorFilter: context.primaryColor.colorFilter)
        .center()
        .withSize(12, 12)
        .onTap(() async {
      final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
      String? clipboardText = clipboardData?.text;
      if (clipboardText != null) onPressed?.call(clipboardText);
    });
  }
}
