import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key, this.iconColor, this.onPressed});
  final Color? iconColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Assets.icons.arrowLeft.path
        .toSvg(color: iconColor ?? context.iconColor, width: 24, height: 24)
        .paddingAll(4)
        .onTap(onPressed ?? () => context.pop(context), borderRadius: 6.r.borderRadius)
        .center()
        .rotate(angle: context.isArabic ? 180 : 0);
  }
}
