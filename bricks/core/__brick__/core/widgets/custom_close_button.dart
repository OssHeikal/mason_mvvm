import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../config/extensions/all_extensions.dart';
import '../../resources/resources.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key, this.center = true});
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Assets.icons.close.path
        .toSvg(color: context.errorColor)
        .setContainerToView(borderColor: context.primaryContainerColor, radius: AppSize.s6.r, padding: AppSize.s4.r)
        .onTap(() => context.pop(), borderRadius: AppSize.s6.borderRadius)
        .center(enabled: center);
  }
}
