import 'package:flutter/material.dart';
import 'package:puri_fast_food/models/product_model.dart';
import 'package:puri_fast_food/pages/order_page.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';

class ProductDetails extends StatelessWidget {
  Product model;
  ProductDetails(this.model);

  ApiService apiService = new ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(),
                  )))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  model.image_url,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(fontSize: 35),
                    ),
                    Text(
                      "\u20b9" + model.price.toString(),
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: FlatButton(
                    onPressed: () => apiService.addtocart(model.id,1),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2 + 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffFC6011)),
                      child: Center(
                          child: Text("Add To Bag",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25))),
                    )),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "FOOD DETAILS",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                model.description,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
