import 'package:flutter/material.dart';
import 'package:puri_fast_food/pages/signin_page.dart';
import 'package:puri_fast_food/pages/signup_page.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  color: Color(0xffFC6011),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/Images/Background objects.png'),
                  )),
            ),
            Positioned(
                top: 50,
                bottom: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: Image(
                      image: AssetImage(
                        'assets/Images/Logo.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    radius: 110,
                    backgroundColor: Colors.white,
                  ),
                )),
            Positioned(
              bottom: 5,
              child: Column(children: [
                SizedBox(height: 10),
                Text("Discover the best foods from over 1,000"),
                SizedBox(height: 5),
                Text("restaurants and fast delivery to your doorstep"),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 28.0, left: 8, right: 8, bottom: 5),
                  child: FlatButton(
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xffFC6011),
                        ),
                        height: 70,
                        child: Center(
                            child: Text(
                          "Login ",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                        width: MediaQuery.of(context).size.width - 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffFC6011)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 70,
                        child: Center(
                            child: Text(
                          "Create an Account ",
                          style:
                              TextStyle(color: Color(0xffFC6011), fontSize: 16),
                        )),
                        width: MediaQuery.of(context).size.width - 16,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
