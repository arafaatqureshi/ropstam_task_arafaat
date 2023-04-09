import 'package:arafaat_task_ropstam/utils/routes/routes.dart';
import 'package:arafaat_task_ropstam/utils/routes/routes_name.dart';
import 'package:arafaat_task_ropstam/view_models/auth_view_model.dart';
import 'package:arafaat_task_ropstam/view_models/cars_view_model.dart';
import 'package:arafaat_task_ropstam/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create:(_)=>AuthProvider()),
      ChangeNotifierProvider(create:(_)=>UserViewModel()),
      ChangeNotifierProvider(create:(_)=>CarsViewModel()),
    ],
    child:  MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    ),
    );
  }
}
