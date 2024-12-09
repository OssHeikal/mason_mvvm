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
    this.titleStyle,
    this.initiallyExpanded = false,
  });

  final String title;
  final String? content;
  final bool enableBorder;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? contentPadding;
  final List<Widget>? children;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final bool initiallyExpanded;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  late final ValueNotifier<bool> _isExpanded;

  @override
  void initState() {
    _isExpanded = ValueNotifier(widget.initiallyExpanded);
    super.initState();
  }

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
              initiallyExpanded: widget.initiallyExpanded,
              collapsedShape: _buildShapeBorder(),
              shape: _buildShapeBorder(),
              tilePadding: widget.titlePadding ?? EdgeInsets.symmetric(horizontal: 12.sp),
              childrenPadding: widget.contentPadding ?? EdgeInsets.all(12.sp),
              dense: true,
              onExpansionChanged: (value) => _isExpanded.value = value,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.trailing != null) ...[widget.trailing!, 8.horizontalSpace],
                  _buildDropdownArrow(),
                ],
              ),
              title: Text(widget.title, style: widget.titleStyle ?? context.bodyLarge.s14.semiBold),
              children: widget.children ?? [Text(widget.content ?? '', style: context.bodyMedium.s14)],
            );
          }),
    );
  }

  ShapeBorder? _buildShapeBorder() {
    if (!widget.enableBorder) return null;
    return RoundedRectangleBorder(
      side: BorderSide(color: context.variantBorderColor),
      borderRadius: BorderRadius.circular(6.sp),
    );
  }

  Widget _buildDropdownArrow() {
    return AnimatedRotation(
      turns: _isExpanded.value ? 0.5 : 0,
      duration: 200.milliseconds,
      child: Assets.icons.dropdownArrow.svg(colorFilter: context.iconColor.colorFilter),
    );
  }
}
