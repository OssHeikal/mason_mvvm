import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../config/extensions/all_extensions.dart';
import '../../resources/resources.dart';

class PaginatedListView<T> extends StatelessWidget {
  const PaginatedListView({
    super.key,
    required this.itemBuilder,
    required this.pagingController,
    this.onRetry,
    this.padding,
    this.title,
    this.titleStyle,
    this.enableScroll = true,
    this.height = AppSize.s120,
    this.separatorHeight = AppSize.s16,
    this.separator,
    this.loadingItemBuilder,
    this.emptyItemBuilder,
    this.scrollDirection = Axis.vertical,
  });

  final double height;
  final bool enableScroll;
  final double separatorHeight;
  final Widget? separator;
  final String? title;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final Widget? loadingItemBuilder;
  final Widget Function(BuildContext)? emptyItemBuilder;
  final PagingController<dynamic, T> pagingController;
  final void Function()? onRetry;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scrollDirection == Axis.horizontal ? height : null,
      child: PagedListView.separated(
        shrinkWrap: true,
        pagingController: pagingController,
        scrollDirection: scrollDirection,
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: padding ?? EdgeInsets.symmetric(horizontal: AppSize.screenPadding),
        separatorBuilder: (_, __) => separator ?? SizedBox(height: separatorHeight, width: separatorHeight),
        builderDelegate: PagedChildBuilderDelegate<T>(
          itemBuilder: itemBuilder,
          noItemsFoundIndicatorBuilder: emptyItemBuilder,
          newPageProgressIndicatorBuilder: (context) => const CupertinoActivityIndicator().center(),
          // firstPageErrorIndicatorBuilder: (context) => ErrorScreen(
          //   onRetry: onRetry ?? () => pagingController.refresh(),
          // ),
          firstPageProgressIndicatorBuilder: (context) {
            return loadingItemBuilder ?? const CupertinoActivityIndicator().center();
          },
        ),
      ),
    ).setTitle(
      context,
      title: title,
      gap: AppSize.s8.h,
      titlePadding: AppSize.screenPadding,
      titleStyle: titleStyle ?? context.titleLarge.regular.s14.setHeight(2),
    );
  }
}
