import 'package:arafaat_task_ropstam/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../model/user_model.dart';
import '../utils/routes/routes_name.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/splash_service.dart';


class Auth_Screen extends StatefulWidget {
  @override
  _Auth_ScreenState createState() => _Auth_ScreenState();
}

class _Auth_ScreenState extends State<Auth_Screen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  SplashService splashService = SplashService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Consumer<AuthProvider>(
                  builder: (context, authProvider, child) {
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Handle login or signup logic here
                          if(authProvider.authMode==AuthMode.Login){
                            // print("Login ");
                            // Navigator.pushNamed(context, RoutesName.home);
                            User user = User();
                            user.token="xyz";
                            print(splashService.saveToken(user, context).toString());
                          }
                          else if(authProvider.authMode==AuthMode.Signup){
                            print("Signup ");
                          }
                        }
                      },
                      child: Text(authProvider.authMode == AuthMode.Login
                          ? 'Login'
                          : 'Signup'),
                    );
                  },
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Consumer<AuthProvider>(builder: (BuildContext context, value, Widget? child) {
                      return  GestureDetector(
                          onTap: (){
                            value.switchAuthMode();
                            // Utils.showFlushBarError('message', context);

                          },
                          child: Text(
                            authModeText(context),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                    },)

                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }

  String authModeText(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.authMode == AuthMode.Login) {

      return "Don't have an account? Signup";
    } else {
      return "Already have an account? Login";
    }
  }
}