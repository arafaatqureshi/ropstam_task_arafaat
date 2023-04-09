import 'package:arafaat_task_ropstam/model/user_model.dart';
import 'package:arafaat_task_ropstam/utils/routes/routes_name.dart';
import 'package:arafaat_task_ropstam/view_models/user_view_model.dart';
import 'package:flutter/cupertino.dart';

class SplashService{
  Future<User> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context){

    getUserData().then((value) {
      print("hello"+value.token.toString());
      if(value.token==null || value.token=="null"){
        Navigator.pushNamed(context, RoutesName.auth);
      }
      else {
        Navigator.pushNamed(context, RoutesName.home);
      }


    });

  }
  Future<bool> saveToken(User user,BuildContext context){
    Navigator.pushNamed(context, RoutesName.home);
    return UserViewModel().saveUser(user);
  }
  Future<bool> deleteToken(BuildContext context){
    Navigator.pushNamed(context, RoutesName.auth);
    return UserViewModel().deleteUser();

  }
}