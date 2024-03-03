import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/extensions/widget_extensions.dart';
import '../resources/dimensions_manager.dart';
import '../resources/fonts_manager.dart';

class Toaster {
  Toaster._();
  static void showToast(String text, {bool isError = true}) {
    BotToast.showCustomText(
      duration: const Duration(seconds: 3),
      toastBuilder: (cancelFunc) {
        final Color color = isError ? Colors.red : Colors.green;
        return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade100, spreadRadius: 0, blurRadius: 1, offset: const Offset(0, 2))
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isError ? Icons.warning_amber_rounded : CupertinoIcons.check_mark_circled,
                color: color,
                size: AppSize.s30.sp,
              ),
              AppSize.s8.w.horizontalSpace,
              Text(text, maxLines: 3, style: TextStyle(color: Colors.blue, fontSize: FontSize.s16)).flexible()
            ],
          ),
        ).paddingHorizontal(AppSize.screenPadding.w);
      },
    );
  }

  static void showLoading() {
    BotToast.showCustomLoading(toastBuilder: (cancelFunc) {
      return const Card(
        color: Colors.white,
        child: Padding(padding: EdgeInsets.all(20.0), child: CircularProgressIndicator()),
      );
    });
  }

  static void closeLoading() {
    BotToast.closeAllLoading();
  }

  static void showNotification({
    Widget Function(void Function())? leading,
    Widget Function(void Function())? title,
    Widget Function(void Function())? subtitle,
    Color? backgroundColor,
  }) {
    BotToast.showNotification(
      title: title,
      subtitle: subtitle,
      leading: leading,
      backgroundColor: backgroundColor,
    );
  }
}
