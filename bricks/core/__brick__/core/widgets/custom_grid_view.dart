import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.padding,
    this.title,
    this.titleStyle,
    this.enableScroll = true,
    this.height = AppSize.s120,
    this.separatorHeight = AppSize.s16,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    this.childAspectRatio = 1,
  });

  final int itemCount;
  final double height;
  final bool enableScroll;
  final double separatorHeight;
  final String? title;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? Function(BuildContext, int) itemBuilder;
  final int crossAxisCount;
  final double crossAxisSpacing, mainAxisSpacing, childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: !enableScroll,
      physics: enableScroll ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
      padding: padding ?? EdgeInsets.symmetric(horizontal: AppSize.screenPadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: itemBuilder,
    ).setTitle(
      context,
      title: title,
      gap: AppSize.s8.h,
      titlePadding: AppSize.screenPadding,
      titleStyle: titleStyle ?? context.titleMedium.medium.s14,
    );
  }
}
