import 'package:flutter/material.dart';
import 'package:windowappflutter/core/utils/strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String contentGridViewScreens = "/ContentGridViewScreens";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splashRoute:
      //   return MaterialPageRoute(builder: (_) {
      //     return const ControlBoardScreen();
      //   });

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
