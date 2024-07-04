import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../features/shared/presentation/view/widgets/error_view.dart';
import '../../resources/cubit_status.dart';
import 'all_extensions.dart';

extension CubitStatusEx on CubitStatus {
  Widget build({
    Widget? onInit,
    Widget? onLoading,
    Widget? onFailed,
    required Widget onSuccess,
    bool enableLoading = true,
  }) {
    switch (this) {
      case CubitStatus.init:
        return onInit ?? const SizedBox.shrink();
      case CubitStatus.loading:
        return enableLoading ? onLoading ?? Scaffold(body: const CupertinoActivityIndicator().center()) : onSuccess;
      case CubitStatus.success:
        return onSuccess;
      case CubitStatus.failed:
        return onFailed ?? const ErrorView();
    }
  }

  void listen({
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

extension AuthStatusEx on AuthStatus {
  Widget build({
    Widget? onUnauthorized,
    Widget? onLoading,
    Widget? onFailed,
    required Widget onAuthorized,
  }) {
    switch (this) {
      case AuthStatus.unauthorized:
        return onUnauthorized ?? const SizedBox.shrink();
      case AuthStatus.loading:
        return onLoading ?? const CircularProgressIndicator().center();
      case AuthStatus.authorized:
        return onAuthorized;
      case AuthStatus.failed:
        return onFailed ?? onAuthorized;
    }
  }

  void listen({
    void Function()? onLoading,
    void Function()? onAuthorized,
    void Function()? onUnauthorized,
    void Function()? onInit,
  }) {
    switch (this) {
      case AuthStatus.unauthorized:
        onInit?.call();
        break;
      case AuthStatus.loading:
        onLoading?.call();
        break;
      case AuthStatus.authorized:
        onAuthorized?.call();
        break;
      case AuthStatus.failed:
        onUnauthorized?.call();
        break;
    }
  }
}
