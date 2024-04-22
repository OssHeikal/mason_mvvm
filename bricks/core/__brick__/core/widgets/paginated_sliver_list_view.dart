import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../example/lib/core/resources/resources.dart';

class PaginatedSliverListView<T> extends StatelessWidget {
  const PaginatedSliverListView({
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
    this.loadingItemBuilder,
    this.emptyItemBuilder,
    this.scrollDirection = Axis.vertical,
  });

  final double height;
  final bool enableScroll;
  final double separatorHeight;
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
    return SliverPadding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: AppSize.screenPadding),
      sliver: PagedSliverList.separated(
        pagingController: pagingController,
        separatorBuilder: (_, __) => SizedBox(height: separatorHeight, width: separatorHeight),
        builderDelegate: PagedChildBuilderDelegate<T>(
          itemBuilder: itemBuilder,
          noItemsFoundIndicatorBuilder: emptyItemBuilder,
          newPageProgressIndicatorBuilder: (context) => const CupertinoActivityIndicator().center(),
          firstPageErrorIndicatorBuilder: (context) =>
              ErrorScreen(onRetry: onRetry ?? () => pagingController.refresh()),
          firstPageProgressIndicatorBuilder: (context) {
            return loadingItemBuilder ?? const CupertinoActivityIndicator().center();
          },
        ),
      ),
    );
  }
}
