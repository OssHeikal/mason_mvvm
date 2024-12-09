import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/extensions/all_extensions.dart';

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  StickyHeaderDelegate({
    required this.child,
    this.height = 24,
  });

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child.setContainerToView(
      radius: 0,
      padding: 0,
      color: context.scaffoldBackgroundColor,
    );
  }

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => height.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
