import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puri_fast_food/screens/main_screen.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';
import 'package:puri_fast_food/util/validatior/signIn_validation.dart';
import 'package:puri_fast_food/util/validatior/signup_validation.dart';
import 'pages/signin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInValidation(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpValidation(),
        ),   
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Puri Fast Food",
          theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
          ),
          // home: MainScreen(foodModel: foodModel),'
          home: FutureBuilder(
            future: apiService.checkAuth(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
      return (snapshot.hasData && snapshot.data != null)
          ? MainScreen()
          : SignInPage();
              } else {
      return Scaffold();
              }
            },
          ),
        ),
    );
  }
}
