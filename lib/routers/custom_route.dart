import 'package:flutter/material.dart';
import 'package:storeit/routers/constants_route.dart';
import 'package:storeit/screens/login_screen.dart';
import 'package:storeit/screens/signup_screen.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings routeSettings){
    switch(routeSettings.name){
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case registerRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

    }
  }
}