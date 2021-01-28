import 'package:flutter/cupertino.dart';
import 'package:puri_fast_food/util/validatior/validation_item.dart';

class SignInValidation extends ChangeNotifier {
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  bool _isApiCallProcess = false;

  bool _isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  //getter

  ValidationItem get email => _email;
  ValidationItem get password => _password;
  bool get isApiCallProcess => _isApiCallProcess;

  bool get isValid {
    if (_email != null && _password != null) {
      return true;
    } else {
      return false;
    }
  }
  //setter

  void changeEmail(String value) {
    if (!_isValidEmail(value)) {
      _email = ValidationItem(null, "Please Enter Valid Email");
    } else {
      _email = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 6) {
      _password = ValidationItem(value, null);
    } else {
      _password =
          ValidationItem(null, "Please Enter at least 6 character password");
    }

    notifyListeners();
  }

  void setApiCall() {
    _isApiCallProcess = !_isApiCallProcess;
    notifyListeners();
  }
}
