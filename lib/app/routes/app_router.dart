import 'package:flutter/material.dart';
import 'package:flutter_starter_template_with_bloc/app/modules/home/presentation/pages/home_page.dart';
import 'package:flutter_starter_template_with_bloc/app/modules/second/presentation/pages/second_page.dart';

part 'app_routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.MAIN:
        return MaterialPageRoute(
            builder: (_) => const MyHomePage(title: "My Home Page"));
      case Routes.SECOND_PAGE:
        return MaterialPageRoute(
            builder: (_) => const SecondPage(title: "SecondPage"));
      default:
        return MaterialPageRoute(
            builder: (_) => const MyHomePage(title: "My Home Page"));
    }
  }

  //For disposing any bloc or cubit
  void dispose() {
    //dispose the counter or bloc
  }
}
