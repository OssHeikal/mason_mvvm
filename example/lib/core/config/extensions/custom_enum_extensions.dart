import 'package:al_sadeem_app/core/config/extensions/widget_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../resources/cubit_status.dart';
import '../../resources/resources.dart';
import '../theme/light_theme.dart';

extension CubitStatusEx on CubitStatus {
  Widget build({
    Widget? onInit,
    Widget? onLoading,
    Widget? onFailed,
    required Widget onSuccess,
  }) {
    switch (this) {
      case CubitStatus.init:
        return onInit ?? const SizedBox.shrink();
      case CubitStatus.loading:
        return onLoading ?? const CupertinoActivityIndicator().center();
      case CubitStatus.success:
        return onSuccess;
      case CubitStatus.failed:
        return onFailed ?? const Text('Failed');
    }
  }

  void when({
    void Function()? onLoading,
    void Function()? onSuccess,
    void Function()? onFailed,
    void Function()? onInit,
  }) {
    switch (this) {
      case CubitStatus.init:
        onInit?.call();
        break;
      case CubitStatus.loading:
        onLoading?.call();
        break;
      case CubitStatus.success:
        onSuccess?.call();
        break;
      case CubitStatus.failed:
        onFailed?.call();
        break;
    }
  }
}

extension BookingStatusExtension on BookingStatus {
  String get index {
    switch (this) {
      case BookingStatus.pending:
        return '0';
      case BookingStatus.accepted:
        return '1';
      case BookingStatus.payment:
        return '2';
      case BookingStatus.receiving:
        return '3';
      case BookingStatus.delivering:
        return '4';
      case BookingStatus.completed:
        return '5';
      case BookingStatus.cancelled:
        return '6';
    }
  }

  String get title {
    switch (this) {
      case BookingStatus.pending:
        return LocaleKeys.bookings_status_acceptance_pending.tr();
      case BookingStatus.accepted:
        return LocaleKeys.bookings_status_payment_pending.tr();
      case BookingStatus.payment:
        return LocaleKeys.bookings_status_payment_review.tr();
      case BookingStatus.receiving:
        return LocaleKeys.bookings_status_receiving_pending.tr();
      case BookingStatus.delivering:
        return LocaleKeys.bookings_status_delivery_pending.tr();
      case BookingStatus.completed:
        return LocaleKeys.bookings_status_delivery_confirmed.tr();
      case BookingStatus.cancelled:
        return LocaleKeys.bookings_status_canceled.tr();
    }
  }
}

extension BookingStepsExtension on BookingSteps {
  String get title {
    switch (this) {
      case BookingSteps.acceptance:
        return LocaleKeys.bookings_steps_acceptance.tr();
      case BookingSteps.payment:
        return LocaleKeys.bookings_steps_payment.tr();
      case BookingSteps.receivingCar:
        return LocaleKeys.bookings_steps_receiving.tr();
      case BookingSteps.deliveringCar:
        return LocaleKeys.bookings_steps_delivery.tr();
      default:
        return '';
    }
  }

  String subTitle(BookingStatus status) {
    switch (this) {
      case BookingSteps.acceptance:
        if (status.index == 0) {
          return LocaleKeys.bookings_status_acceptance_pending.tr();
        } else if (status.index == 6) {
          return LocaleKeys.bookings_status_acceptance_rejected.tr();
        } else {
          return LocaleKeys.bookings_status_acceptance_confirmed.tr();
        }
      case BookingSteps.payment:
        if (status.index == 1) {
          return LocaleKeys.bookings_status_payment_pending.tr();
        } else if (status.index == 2) {
          return LocaleKeys.bookings_status_payment_review.tr();
        } else if (status.index >= 3 && status.index != 6) {
          return LocaleKeys.bookings_status_payment_paid.tr();
        } else {
          return ' - ';
        }
      case BookingSteps.receivingCar:
        if (status.index == 3) {
          return LocaleKeys.bookings_status_receiving_pending.tr();
        } else if (status.index >= 4 && status.index != 6) {
          return LocaleKeys.bookings_status_receiving_confirmed.tr();
        } else {
          return ' - ';
        }
      case BookingSteps.deliveringCar:
        if (status.index == 4) {
          return LocaleKeys.bookings_status_delivery_pending.tr();
        } else if (status.index >= 5 && status.index != 6) {
          return LocaleKeys.bookings_status_delivery_confirmed.tr();
        } else {
          return ' - ';
        }
      default:
        return '';
    }
  }

  Color indicatorColor(status) {
    const currentStepColor = Color(0X2F848B8F);
    const completedStepColor = Color(0xFFFBF1DA);
    const upcomingStepColor = LightThemeColors.primaryContainer;
    switch (this) {
      case BookingSteps.acceptance:
        if (status.index == 0) {
          return currentStepColor;
        } else if (status.index == 6) {
          return completedStepColor;
        } else {
          return completedStepColor;
        }
      case BookingSteps.payment:
        if (status.index == 1) {
          return currentStepColor;
        } else if (status.index == 2) {
          return currentStepColor;
        } else if (status.index >= 3 && status.index != 6) {
          return completedStepColor;
        } else {
          return upcomingStepColor;
        }
      case BookingSteps.receivingCar:
        if (status.index == 3) {
          return currentStepColor;
        } else if (status.index >= 4 && status.index != 6) {
          return completedStepColor;
        } else {
          return upcomingStepColor;
        }
      case BookingSteps.deliveringCar:
        if (status.index == 4) {
          return currentStepColor;
        } else if (status.index >= 5 && status.index != 6) {
          return completedStepColor;
        } else {
          return upcomingStepColor;
        }
      default:
        return upcomingStepColor;
    }
  }

  String get iconPath {
    switch (this) {
      case BookingSteps.acceptance:
        return Assets.icons.milestone.path;
      case BookingSteps.payment:
        return Assets.icons.creditCard.path;
      case BookingSteps.receivingCar:
        return Assets.icons.milestone.path;
      case BookingSteps.deliveringCar:
        return Assets.icons.milestone.path;
      default:
        return '';
    }
  }

  Color? iconColor(BookingStatus status) {
    const currentStepColor = Color(0xFF848B8F);
    const completedStepColor = Color(0xFFECB43C);
    switch (this) {
      case BookingSteps.acceptance:
        if (status.index == 0) {
          return currentStepColor;
        } else if (status.index == 6) {
          return completedStepColor;
        } else {
          return completedStepColor;
        }
      case BookingSteps.payment:
        if (status.index == 1) {
          return currentStepColor;
        } else if (status.index == 2) {
          return currentStepColor;
        } else if (status.index >= 3 && status.index != 6) {
          return completedStepColor;
        } else {
          return null;
        }
      case BookingSteps.receivingCar:
        if (status.index == 3) {
          return currentStepColor;
        } else if (status.index >= 4 && status.index != 6) {
          return completedStepColor;
        } else {
          return null;
        }
      case BookingSteps.deliveringCar:
        if (status.index == 4) {
          return currentStepColor;
        } else if (status.index >= 5 && status.index != 6) {
          return completedStepColor;
        } else {
          return null;
        }
      default:
        return null;
    }
  }
}
