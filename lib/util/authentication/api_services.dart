import 'package:dio/dio.dart';
import 'package:puri_fast_food/models/category_model.dart';
import 'package:puri_fast_food/models/login.dart';
import 'package:puri_fast_food/models/product_model.dart';
import 'package:puri_fast_food/models/restaurant_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Dio dio = new Dio();

  var url = "http://0bd4c6749485.ngrok.io";

  
  Future<Login> createCustomer(
      String username, String email, String password) async {
    var data;
    try {
      var response = await dio.post(
        "$url/api/auth/register",
        data: {
          "name": username,
          "email": email,
          "password": password,
        },
        options: new Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 201) {
        data = Login.fromJson(response.data);
      }
     
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future<Login> loginCustomer(String email, String password) async {
    Login data;
    try {
      var response = await dio.post(
        "$url/api/auth/login",
        data: {
          "email": email,
          "password": password,
        },
        options: new Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 201) {
        data = Login.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    try {
      var response = await dio.get(
        "$url/api/user",
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      print(e.message);
    }
  }

  Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    try {
      var response = await dio.get(
        "$url/api/logout",
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      print(e.message);
    }
  }

  Future<List<Product>> getProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    List<Product> data;
    try {
      var response = await dio.get(
        "$url/api/products",
        options: new Options(
            // headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = (response.data as List).map((i) => Product.fromJson(i)).toList();
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

   Future<List<Product>> getProductbyCategory(var id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    List<Product> data;
    try {
      var response = await dio.get(
        "$url/api/category/product/$id",
        options: new Options(
            // headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = (response.data as List).map((i) => Product.fromJson(i)).toList();
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }
  Future<List<Category>> getCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    List<Category> data;
    try {
      var response = await dio.get(
        "$url/api/category",
        options: new Options(
            // headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data =
            (response.data as List).map((e) => Category.fromJson(e)).toList();
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future<List<Restaurant>> getRestaurant() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    List<Restaurant> data;
    try {
      var response = await dio.get(
        "$url/api/restaurants",
        options: new Options(
            // headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data =
            (response.data as List).map((e) => Restaurant.fromJson(e)).toList();
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }
}