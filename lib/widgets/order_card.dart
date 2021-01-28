import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: Color(0xffd3d3d3)),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 75,
              width: 45,

              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: (){},
                      child: Icon(Icons.keyboard_arrow_up,color: Color(0xffd3d3d3),)),
                  Text("0",style: TextStyle(
                    fontSize: 18,color: Color(0xffd3d3d3),
                  ),),
                  InkWell(
                    onTap: (){},
                      child: Icon(Icons.keyboard_arrow_down,color: Color(0xffd3d3d3),)),
                ],
              ),
            ),
            SizedBox(width: 15,),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/lunch.jpeg"),
                  fit: BoxFit.cover,

                ),
                borderRadius: BorderRadius.circular(35),
                boxShadow: [BoxShadow(
                  color: Colors.black,
                  blurRadius: 7,
                  offset: Offset(0,5),
                )]
              ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Chicken",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text("\u20b9 3.0",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.orangeAccent),),
                SizedBox(height: 5,),
                Container(
                  height: 25,
                  width: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          children: <Widget>[
                            Text("Milk",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Text("x",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: (){},
                child: Icon(Icons.cancel,color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
