import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A class that defines the route names for the application.
///
/// - [name] is the name of the route.
/// - [path] is the path of the route.
///
/// Example usage:
/// ```dart
/// AppRoutes.home.push(context);
/// ```
class AppRoutes extends AppRoute {
  AppRoutes(super.name, super.path);

  // App routes
  static const splash = AppRoute('splash', '/');
  static const onboarding = AppRoute('onboarding', '/onboarding');

  // Auth routes
  static const register = AppRoute('register', '/register');
  static const verifyCode = AppRoute('verifyCode', '/verifyCode');
  static const attachDocs = AppRoute('attachDos', '/attachDos');
  static const login = AppRoute('login', '/login');
  static const forgetPassword = AppRoute('forgetPassword', 'forgetPassword');
  static const verifyForgetPassword = AppRoute('verifyForgetPassword', 'verifyForgetPassword');
  static const resetPassword = AppRoute('resetPassword', 'resetPassword');

  // Home routes
  static const home = AppRoute('home', '/home');
  static const searchResult = AppRoute('searchResult', 'searchResult');
  static const map = AppRoute('map', 'map');
  static const filter = AppRoute('filter', 'filter');

  // explore routes
  static const explore = AppRoute('explore', '/explore');

  // bookings routes
  static const bookings = AppRoute('bookings', '/bookings');
  static const bookingDetails = AppRoute('bookingDetails', 'bookingDetails');

  // settings routes
  static const settings = AppRoute('settings', '/settings');
  static const contactUs = AppRoute('contactUs', 'contactUs');
  static const profile = AppRoute('profile', 'profile');
  static const aboutUs = AppRoute('aboutUs', 'aboutUs');
  static const terms = AppRoute('terms', 'terms');
  static const language = AppRoute('language', 'language');

  // car routes
  static const carDetails = AppRoute('carDetails', '/carDetails');
  static const carExtras = AppRoute('carExtras', 'carExtras');
  static const confirmCarBooking = AppRoute('confirmCarBooking', 'confirmCarBooking');
  static const paymentDetails = AppRoute('paymentDetails', 'paymentDetails');

  // notifications routes
  static const notifications = AppRoute('notifications', '/notifications');
}

class AppRoute {
  final String name;
  final String path;

  const AppRoute(this.name, this.path);

  /// Pushes the route with the given name onto the navigator.
  Future<T?> push<T extends Object?>(
    BuildContext context, {
    Object? extra,
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queries = const <String, dynamic>{},
  }) {
    return context.pushNamed(name, extra: extra, queryParameters: queries, pathParameters: params);
  }

  /// Pushes a new route onto the navigator, and replaces the current route with the new route.
  void pushReplacement<T extends Object?>(
    BuildContext context, {
    Object? extra,
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queries = const <String, dynamic>{},
  }) {
    context.pushReplacementNamed(name, extra: extra, queryParameters: queries, pathParameters: params);
  }

  /// Navigates to the specified route.
  void go<T extends Object?>(
    BuildContext context, {
    Object? extra,
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queries = const <String, dynamic>{},
  }) {
    return context.goNamed(name, extra: extra, queryParameters: queries, pathParameters: params);
  }
}
