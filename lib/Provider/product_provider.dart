import 'package:flutter/cupertino.dart';
import 'package:puri_fast_food/models/product_model.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';

class ProductProvider with ChangeNotifier {
  ApiService apiService = ApiService();

  List<Product> _products = [];

  List<Product> get products => _products;
  
  void resetStreams() {
    apiService = ApiService();
    _products = List<Product>();
  }

   fetchProducts() {
    apiService.getProduct().then((value) => _products.addAll(value));
    notifyListeners();
  }
}
