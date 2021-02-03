import 'package:flutter/material.dart';
import 'package:puri_fast_food/models/user_model.dart';
import 'package:puri_fast_food/pages/signin_page.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => apiService.logout().then((val) {
              apiService.checkAuth();
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ));
              });
            }),
          )
        ],
        centerTitle: true,
      ),
      body: FutureBuilder<User>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 100,
                      child: (snapshot.data.imageUrl != null)
                          ? Image.network(snapshot.data.imageUrl)
                          : Image.asset('assets/Images/Logo.png'),
                    ),
                  ),
                  (snapshot.data.name != null)
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(snapshot.data.name),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("data"),
                        ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.data.email),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(snapshot.data.bio),
                  // ),
                ],
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
        future: apiService.checkAuth(),
      ),
    );
  }
}
