import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'custom_search_field.dart';
import '../../config/extensions/all_extensions.dart';
import '../../resources/resources.dart';

class CustomAppBar {
  static AppBar build(
    BuildContext context, {
    String? titleText,
    TextStyle? titleStyle,
    Widget? title,
    Widget? leading,
    double leadingWidth = AppSize.s70,
    List<Widget>? actions,
    bool removeBack = false,
    bool centerTitle = true,
    Color? backgroundColor,
    Color? iconColor,
    Widget? bottom,
    double bottomHeight = AppSize.s40,
    double height = kToolbarHeight,
  }) {
    return AppBar(
      toolbarHeight: height,
      titleTextStyle: titleStyle ?? context.titleLarge.bold.s20,
      iconTheme: context.iconTheme!.copyWith(color: iconColor),
      backgroundColor: backgroundColor,
      leadingWidth: leadingWidth.sp,
      centerTitle: centerTitle,
      automaticallyImplyLeading: removeBack == true ? false : true,
      leading: leading ??
          (removeBack || !context.canPopScreen
              ? null
              : Assets.icons.arrowLeft.path
                  .toSvg(color: iconColor)
                  .center()
                  .onTap(() => context.pop(context))
                  .rotate(angle: context.isArabic ? 0 : 180)),
      title: title ?? Text(titleText ?? ''),
      actions: actions,
      bottom: bottom != null ? PreferredSize(preferredSize: Size.fromHeight(bottomHeight.h), child: bottom) : null,
    );
  }

  static AppBar search(
    BuildContext context, {
    void Function(String)? onChanged,
    Widget? bottom,
    String? hintText,
    double bottomHeight = AppSize.s40,
    void Function()? onFilter,
  }) {
    return AppBar(
      toolbarHeight: AppSize.s90.h,
      title: CustomSearchField(onChanged: onChanged, hintText: hintText, onFilter: onFilter),
      bottom: bottom != null ? PreferredSize(preferredSize: Size.fromHeight(bottomHeight.h), child: bottom) : null,
    );
  }
}
