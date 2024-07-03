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
        .toSvg(color: iconColor ?? context.iconColor, width: AppSize.s24, height: AppSize.s24)
        .setContainerToView(borderColor: context.secondaryColor, radius: AppSize.s6.r, padding: AppSize.s4.r)
        .onTap(onPressed ?? () => context.pop(context), borderRadius: AppSize.s6.r.borderRadius)
        .center()
        .rotate(angle: context.isArabic ? 0 : 180)
        .paddingStart(AppSize.s8.sp);
  }
}
