import 'package:flutter/material.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Logout"),
        onPressed: () => apiService.logout().then((val) {
          apiService.checkAuth();
          Navigator.pop(context);
        }),
      ),
    );
  }
}
