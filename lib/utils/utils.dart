
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:another_flushbar/flushbar.dart';
class Utils{

  static void showFlushBarError(String message, BuildContext context){
      showFlushbar(context: context, flushbar: Flushbar(
        message: message,
        duration: Duration(seconds: 3),
      )..show(context)
      );
  }
}