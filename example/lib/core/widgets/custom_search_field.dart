import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.onChanged, this.hintText, this.onFilter});

  final void Function(String)? onChanged;
  final String? hintText;
  final void Function()? onFilter;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: Assets.icons.search.path.toSvg(color: context.hintColor).paddingAll(AppSize.s4),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: AppSize.s10.borderRadius)),
      elevation: WidgetStateProperty.all(0),
      backgroundColor: WidgetStateProperty.all(context.primaryCardColor),
      onChanged: onChanged,
      constraints: BoxConstraints(minHeight: AppSize.s55.h),
      hintText: hintText ?? 'Search...',
      hintStyle: WidgetStateProperty.all(context.hintTextStyle),
      trailing: [Assets.icons.filter.path.toSvg().paddingAll(AppSize.s4).onTap(() => onFilter?.call())],
    );
  }
}
