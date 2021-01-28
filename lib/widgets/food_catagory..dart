import 'package:flutter/material.dart';
import 'package:puri_fast_food/models/category_model.dart';
import 'package:puri_fast_food/pages/category_product.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';

import 'food_Card.dart';

class FoodCatagory extends StatelessWidget {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    // final categories = Provider.of<CategoryProvider>(context);
    return Container(
      height: 80.0,
      child: FutureBuilder<List<Category>>(
          future: apiService.getCategory(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder:(context) => CategoryProduct(snapshot.data[index]), )) ;
                    },
                    child: Container(
                      child: FoodCard(
                        catagoryName: snapshot.data[index].name,
                        imagePath: snapshot.data[index].image_url,
                        catagoryNumber: index+1,
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
