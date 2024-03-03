import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.padding,
    this.title,
    this.titleStyle,
    this.enableScroll = true,
    this.height = AppSize.s120,
    this.separatorHeight = AppSize.s16,
  });

  final int itemCount;
  final double height;
  final bool enableScroll;
  final double separatorHeight;
  final String? title;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: !enableScroll,
      physics: enableScroll ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
      padding: padding ?? EdgeInsets.symmetric(horizontal: AppSize.screenPadding),
      separatorBuilder: (_, __) => separatorHeight.h.verticalSpace,
      itemBuilder: itemBuilder,
    ).setTitle(
      context,
      title: title,
      gap: AppSize.s8.h,
      titlePadding: AppSize.screenPadding,
      titleStyle: titleStyle ?? context.titleLarge!.regular.s14.setHeight(2),
    );
  }
}
