import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


enum AuthMode { Signup, Login }

class AuthProvider with ChangeNotifier {
  AuthMode _authMode = AuthMode.Login;

  void switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      _authMode = AuthMode.Signup;
    } else {
      _authMode = AuthMode.Login;
    }
    notifyListeners();
  }


  AuthMode get authMode => _authMode;
}
