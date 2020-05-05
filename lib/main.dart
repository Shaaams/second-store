import 'package:flutter/material.dart';
import 'package:storeit/routers/constants_route.dart';
import 'package:storeit/routers/custom_route.dart';
import 'package:storeit/screens/login_screen.dart';
import 'package:storeit/screens/signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: CustomRoute.allRoutes,
      initialRoute: loginRoute,
//      routes: {
//        LoginScreen.id  : (context)=>LoginScreen(),
//        SignUpScreen.id : (context)=>SignUpScreen(),
//      },
      debugShowCheckedModeBanner: false,
    );
  }
}
