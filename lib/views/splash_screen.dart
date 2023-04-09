import 'package:arafaat_task_ropstam/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../view_models/splash_service.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService = SplashService();
  @override
  void initState() {
    // navigate();
    super.initState();
    splashService.checkAuthentication(context);
  }
  // void navigate() {
  //   Navigator.pushNamed(context, RoutesName.auth);
  // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Ropstam Task", style: TextStyle(fontSize: 25),),
              SizedBox(height: 10,),
              Text("By", style: TextStyle(fontSize: 15),),
              Text("Arafaat Ahmad Qureshi", style: TextStyle(fontSize: 15),),
            ],
          ),
        ),
    );
  }
}

