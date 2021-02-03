import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puri_fast_food/pages/signin_page.dart';
import 'package:puri_fast_food/screens/main_screen.dart';
import 'package:puri_fast_food/util/Progress.aHUD.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';
import 'package:puri_fast_food/util/form_helper.dart';
import 'package:puri_fast_food/util/validatior/signup_validation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _togglevisibility = true;
  bool _toggleConfirmvisibility = true;
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    var sigupValidator = Provider.of<SignUpValidation>(context);
    return Scaffold(
      body: ProgressHUD(
        inAsyncCall: sigupValidator.isApiCallProcess,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height/4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/Images/Logo.png'),
                    )),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Color(0xffFC6011)),
                    ),
                  ),
                  
                  Consumer<SignUpValidation>(
                      builder: (context, sigupValidator, child) {
                    return Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              onChanged: (value) {
                                sigupValidator.changeUsername(value);
                              },
                              decoration: InputDecoration(
                                errorText: sigupValidator.username.error,
                                hintText: "Enter Your Username",
                                hintStyle: TextStyle(
                                    color: Color(0xffbdc2cb), fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              onChanged: (value) {
                                sigupValidator.changeEmail(value);
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Your Email",
                                errorText: sigupValidator.email.error,
                                hintStyle: TextStyle(
                                    color: Color(0xffbdc2cb), fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              onChanged: (value) {
                                sigupValidator.changePassword(value);
                              },
                              decoration: InputDecoration(
                                errorText: sigupValidator.password.error,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _togglevisibility = !_togglevisibility;
                                    });
                                  },
                                  icon: _togglevisibility
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: Color(0xffbdc2cb),
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: Color(0xffFC6011),
                                        ),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color(0xffbdc2cb), fontSize: 18),
                              ),
                              obscureText: _togglevisibility,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              
                              onChanged: (value) {
                                sigupValidator.confirmPass(value);
                              },
                              decoration: InputDecoration(
                                errorText: sigupValidator.confirm_pass.error,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _toggleConfirmvisibility =
                                          !_toggleConfirmvisibility;
                                    });
                                  },
                                  icon: _toggleConfirmvisibility
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: Color(0xffbdc2cb),
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: Color(0xffFC6011),
                                        ),
                                ),
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                    color: Color(0xffbdc2cb), fontSize: 18),
                              ),
                              obscureText: _toggleConfirmvisibility,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      sigupValidator.setApiCall();
                      if (sigupValidator.isValid != null) {
                        apiService
                            .createCustomer(
                                sigupValidator.username.value,
                                sigupValidator.email.value,
                                sigupValidator.password.value)
                            .then((ret) {
                          sigupValidator.setApiCall();
                          // print(ret.accessToken);

                          if (ret != null) {
                            SharedPreferences.getInstance().then((value) =>
                                value.setString('token', ret.accessToken));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ));
                          } else {
                            FormHelper.showMessage(context, "SuperStore App",
                                "Email id Already Exsits", "OK", () {
                              Navigator.pop(context);
                            });
                          }
                        });
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xffFC6011),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 20,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: Color(0xffbdc2cb),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignInPage()));
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Color(0xffFC6011),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
