import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/extensions/context_extensions.dart';
import '../config/extensions/widget_extensions.dart';
import '../resources/dimensions_manager.dart';

class OverlayUtils {
  /// Shows a custom dialog.
  ///
  /// This method is used to display a custom dialog on the screen.
  /// The [child] widget is the content of the dialog.
  static void showCustomDialog({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: barrierDismissible,
      builder: (context) => child,
    );
  }

  /// Shows a bottom sheet.
  ///
  /// This method is used to display a bottom sheet on the screen.
  /// The [child] widget is the content of the bottom sheet.
  static void showBottomSheet({required BuildContext context, required Widget child}) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: context.bottomSheetBackground,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s14.r)),
              ),
              child: child.setContainerToView(width: context.width).paddingVertical(AppSize.s20.h),
            ),
          ],
        );
      },
    );
  }

  /// Shows a scrollable bottom sheet.
  ///
  /// This method is used to display a scrollable bottom sheet on the screen.
  /// The [child] widget is the content of the bottom sheet.
  static void showScrollableBottomSheet({
    required BuildContext context,
    required Widget child,
    Color? barrierColor,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      barrierColor: barrierColor,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          maxChildSize: 0.85,
          minChildSize: 0.5,
          initialChildSize: 0.85,
          builder: (context, controller) => child,
        );
      },
    );
  }
}
