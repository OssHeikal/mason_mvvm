import 'package:bot_toast/bot_toast.dart';
import 'package:evently/modules/client/configs/client_router.dart';
import 'package:evently/modules/seller/configs/seller_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../modules/common/configs/common_router.dart';
import '../../../modules/common/configs/common_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class RouteManager {
  static void configureRoutes() {
    CommonRouter().registerRoutes();
    ClientRouter().registerRoutes();
    SellerRouter().registerRoutes();
  }
}

abstract class BaseRouter {
  static final routerConfig = GoRouter(
    routes: routes,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    observers: [BotToastNavigatorObserver()],
    initialLocation: CommonRoutes.splash.path,
  );

  static final List<RouteBase> routes = [];
  void registerRoutes();
}
