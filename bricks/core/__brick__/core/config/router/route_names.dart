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
