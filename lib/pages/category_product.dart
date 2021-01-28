import 'package:flutter/material.dart';
import 'package:puri_fast_food/models/category_model.dart';
import 'package:puri_fast_food/models/product_model.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';
import 'package:puri_fast_food/widgets/bought_food.dart';

class CategoryProduct extends StatelessWidget {
  Category data;
  CategoryProduct(this.data);
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            data.name,
          )),
      body: FutureBuilder<List<Product>>(
        future: apiService.getProductbyCategory(data.id),
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            var product = snapshot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: product.map((food) {
                  return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: BoughtFoods(
                        id: food.id,
                        catagory: food.categoryId,
                        price: food.price,
                        image: food.image_url,
                        name: food.name,
                      ));
                }).toList()),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
