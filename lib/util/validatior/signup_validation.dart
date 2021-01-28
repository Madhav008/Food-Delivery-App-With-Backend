import 'package:flutter/cupertino.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';
import 'package:puri_fast_food/util/validatior/validation_item.dart';

class SignUpValidation with ChangeNotifier {
  ApiService apiService = ApiService();
  ValidationItem _username = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _confirm_pass = ValidationItem(null, null);
  bool _isApiCallProcess = false;
  bool _isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
//getter

  ValidationItem get username => _username;
  ValidationItem get email => _email;
  ValidationItem get password => _password;
  ValidationItem get confirm_pass => _confirm_pass;
  bool get isApiCallProcess => _isApiCallProcess;
  bool get isValid {
    if (_email != null &&
        _password != null &&
        _username != null &&
        _confirm_pass != null) {
      return true;
    } else {
      return false;
    }
  }

//setter
  void changeUsername(String value) {
    if (value.isNotEmpty) {
      _username = ValidationItem(value, null);
    } else {
      _username = ValidationItem(null, 'Please Enter usernane');
    }
    notifyListeners();
  }

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

  void confirmPass(String value) {
    if (value == password.value) {
      _confirm_pass = ValidationItem(value, null);
    } else {
      _confirm_pass = ValidationItem(null, "Password does not macth");
    }

    notifyListeners();
  }

   void setApiCall() {
    _isApiCallProcess = !_isApiCallProcess;
    notifyListeners();
  }
}
