import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puri_fast_food/Provider/cart_provider.dart';
import 'package:puri_fast_food/pages/order_page.dart';
import 'package:puri_fast_food/pages/signin_page.dart';
import 'package:puri_fast_food/pages/splash_screen.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';
import 'package:puri_fast_food/util/validatior/signIn_validation.dart';
import 'package:puri_fast_food/util/validatior/signup_validation.dart';

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
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: OrderPage(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Puri Fast Food",
        theme: ThemeData(
          primaryColor: Color(0xffFC6011),
        ),
        home: FutureBuilder(
          future: apiService.checkAuth(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return (snapshot.hasData && snapshot.data != null)
                  ? SplashScreen()
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
