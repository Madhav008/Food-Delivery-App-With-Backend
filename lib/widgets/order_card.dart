import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puri_fast_food/Provider/cart_provider.dart';
import 'package:puri_fast_food/models/cart_model.dart';
import 'package:puri_fast_food/models/product_model.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';

class OrderCard extends StatelessWidget {
  Cart model;
  OrderCard(this.model);
  ApiService apiService = new ApiService();
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Color(0xffd3d3d3)),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 75,
              width: 45,
              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        // if(cart.quantity[model.productId]==null){
                        //   cart.quantity[model.productId]=model.cartProdQty;
                        // }
                         cart.quantity[model.productId]++;
                          cart.changeQty(model.productId,cart.quantity[model.productId]);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_up,
                        color: Color(0xffd3d3d3),
                      )),
                  Text(
                    cart.quantity[model.productId].toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xffd3d3d3),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        // if(cart.quantity[model.productId]==null){
                        //   cart.quantity[model.productId]=model.cartProdQty;
                        // }
                        if(cart.quantity[model.productId]>1){
                          cart.quantity[model.productId]--;
                          cart.changeQty(model.productId, cart.quantity[model.productId]);
                        }
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xffd3d3d3),
                      )),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              height: 70,
              width: 70,
              child: Image.network(
                model.products.image_url,
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 7,
                      offset: Offset(0, 5),
                    )
                  ]),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.products.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "\u20b9 ${model.products.price}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent),
                ),
                SizedBox(
                  height: 5,
                ),
                // Container(
                //   height: 25,
                //   width: 120,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.only(right: 10),
                //         child: Row(
                //           children: <Widget>[
                //             Text(
                //               "Milk",
                //               style: TextStyle(
                //                   color: Colors.grey,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //             SizedBox(
                //               width: 5,
                //             ),
                //             Text(
                //               "x",
                //               style: TextStyle(
                //                   color: Colors.red,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  cart.removeProduct(model.productId);
                },
                child: Icon(Icons.cancel, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
