import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/extensions/all_extensions.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/custom_button.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
    required this.icon,
    required this.title,
    this.buttonLabel,
    this.onButtonPressed,
    this.padding = AppSize.s55,
  });

  final Widget icon;
  final String title;
  final String? buttonLabel;
  final Function()? onButtonPressed;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        Text(title).center(),
        AppSize.s45.verticalSpace,
        if (buttonLabel != null)
          CustomButton(
            label: buttonLabel!,
            onPressed: onButtonPressed ?? () {},
          ),
      ],
    ).paddingHorizontal(padding.sp).center();
  }
}
