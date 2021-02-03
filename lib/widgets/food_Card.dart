import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String catagoryName;
  final String imagePath;
  final int catagoryNumber;

  FoodCard({
    this.catagoryName,
    this.catagoryNumber,
    this.imagePath,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 18.0),
      child: Card(
        elevation: 4,
        color: Colors.redAccent,
        shadowColor: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Row(
            children: <Widget>[
              Image(
                image: NetworkImage(imagePath),
                height: 60.0,
                width: 60.0,
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    catagoryName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text("$catagoryNumber Kinds"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
