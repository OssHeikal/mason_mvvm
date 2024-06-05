import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/extensions/all_extensions.dart';
import '../resources/resources.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    this.content,
    this.enableBorder = true,
    this.titlePadding,
    this.contentPadding,
    this.children,
    this.trailing,
  });

  final String title;
  final String? content;
  final bool enableBorder;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? contentPadding;
  final List<Widget>? children;
  final Widget? trailing;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ValueListenableBuilder(
          valueListenable: _isExpanded,
          builder: (context, value, child) {
            return ExpansionTile(
              maintainState: true,
              enableFeedback: true,
              collapsedShape: widget.enableBorder
                  ? RoundedRectangleBorder(
                      side: BorderSide(color: context.variantBorderColor),
                      borderRadius: BorderRadius.circular(AppSize.s6.sp),
                    )
                  : null,
              shape: widget.enableBorder
                  ? RoundedRectangleBorder(
                      side: BorderSide(color: context.variantBorderColor),
                      borderRadius: BorderRadius.circular(AppSize.s6.sp),
                    )
                  : null,
              tilePadding: widget.titlePadding ?? EdgeInsets.symmetric(horizontal: AppSize.s12.sp),
              childrenPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(horizontal: AppSize.s12.sp).copyWith(bottom: AppSize.s16.sp),
              dense: true,
              onExpansionChanged: (value) => _isExpanded.value = value,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.trailing != null) ...[
                    widget.trailing!,
                    AppSize.s8.horizontalSpace,
                  ],
                  Assets.icons.arrowDown.svg(colorFilter: context.iconColor.colorFilter).rotate(angle: value ? 180 : 0),
                ],
              ),
              title: Text(widget.title, style: context.titleMedium!.s14.regular),
              children: widget.children ?? [Text(widget.content ?? '', style: context.bodyMedium!.s14)],
            );
          }),
    );
  }
}
