import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class RouteManager {
  static void configureRoutes() {
  }
}

abstract class BaseRouter {
  static final routerConfig = GoRouter(
    routes: routes,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    observers: [BotToastNavigatorObserver()],
    initialLocation: '/',
  );

  static final List<RouteBase> routes = [];
  void registerRoutes();
}
