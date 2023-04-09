
import 'package:arafaat_task_ropstam/utils/routes/routes_name.dart';
import 'package:arafaat_task_ropstam/views/Home.dart';
import 'package:arafaat_task_ropstam/views/AuthScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../views/splash_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const Home());
      case RoutesName.auth:
        return MaterialPageRoute(builder: (BuildContext context) => Auth_Screen());
        case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No Routes"),
            ),
          );
        });
    }
  }
}