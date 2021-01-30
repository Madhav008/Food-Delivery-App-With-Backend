import 'package:flutter/material.dart';
import 'package:puri_fast_food/models/product_model.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';
import 'package:puri_fast_food/widgets/bought_food.dart';

class FavoritePage extends StatelessWidget {
  ApiService apiService = ApiService();
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
      child: FutureBuilder<List<Product>>(
        future: apiService.getFavoriteProduct(),
        builder: (context, snapshot) {
          var product = snapshot.data;
          if (snapshot.connectionState != ConnectionState.waiting) {
            if (snapshot.hasData && snapshot.data != null) {
              return SingleChildScrollView(
                child: Column(
                    children: product.map((food) {
                  return GestureDetector(
                    onTap: () {
                    
                      apiService
                          .deleteFavorite(food.id)
                          .then((value) => print("delete to Fav"));
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
                }).toList()),
              );
            } else {
              return Center(
                child: Text("Add Some Favorites "),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
