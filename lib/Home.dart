import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puri_fast_food/models/product_model.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';
import 'package:puri_fast_food/widgets/Home_Top_Info.dart';
import 'package:puri_fast_food/widgets/bought_food.dart';
import 'package:puri_fast_food/widgets/food_catagory..dart';
import 'widgets/text_field.dart';
import 'widgets/bought_food.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  int userId;

  Future<int> user() async {
    var user = await apiService.checkAuth();
    userId = user.id;
    return userId;
  }

  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Home_Top_Info(),
              FoodCatagory(),
              SizedBox(
                height: 10,
              ),
              SearchBox(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Frequently Bought Items",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Text(
                      "view all",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              FutureProvider(
                create: (context) => apiService.getProduct(),
                child:
                    Consumer<List<Product>>(builder: (context, product, child) {
                  return (product == null)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: product.map((food) {
                          return GestureDetector(
                            onTap: () {
                              user();
                              apiService.addtoFavorite(food.id, userId);
                              print("Added to Fav");
                            },
                            child: Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: BoughtFoods(
                                  id: food.id,
                                  catagory: food.categoryId,
                                  price: food.price,
                                  image: food.image_url,
                                  name: food.name,
                                )),
                          );
                        }).toList());
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Expanded(
//               child: FutureBuilder<List<Product>>(
//                   future: widget.apiService.getProduct(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData && snapshot.data != null) {
//                       return ListView.builder(
//                         shrinkWrap: true,
//                         // physics: NeverScrollableScrollPhysics(),
//                         itemCount: snapshot.data.length,
//                         itemBuilder: (context, index) {
//                           var food = snapshot.data[index];
//                           return Expanded(
// child: Container(
//   margin: EdgeInsets.only(bottom: 20),
//   child: BoughtFoods(
//     id: food.id,
//     catagory: food.categoryId,
//     price: food.price,
//     name: food.name,
//   ),
//                             ),
//                           );
//                         },
//                       );
//                     } else {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                   }),
//             ),
