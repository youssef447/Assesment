import 'package:assesment_app/view/home_page/home.dart';
import 'package:flutter/material.dart';

import '../../view/details_page/details_screen.dart';
import 'pageRouteBuilder.dart';
import 'routes.dart';

class RouteGenerator {
  RouteGenerator._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.detailsScreen:
        if (args is List<dynamic>) {
          return DefaultPageRouteBuilder.animatedScaleRoute(
            screen: DetailsScreen(
              id: args[0],
              description: args[1],
              cubit: args[2],
            ),
          );
        }

      case AppRoutes.homeScreen:
        return DefaultPageRouteBuilder.defaultRoute(screen: const HomeScreen());
    }
    return MaterialPageRoute(
      builder: (context) => const Center(
        child: Text('Unknown Screen'),
      ),
    );
  }
}
