import 'package:dio/dio.dart';
import 'package:puri_fast_food/models/cart_model.dart';
import 'package:puri_fast_food/models/category_model.dart';
import 'package:puri_fast_food/models/login.dart';
import 'package:puri_fast_food/models/product_model.dart';
import 'package:puri_fast_food/models/restaurant_model.dart';
import 'package:puri_fast_food/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Dio dio = new Dio();

  var url = "http://36edf8fb4ad3.ngrok.io";

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

  Future<User> checkAuth() async {
    User data;
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
        data = User.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
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

  Future<List<Product>> getFavoriteProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    List<Product> data;
    try {
      var response = await dio.get(
        "$url/api/favorite/",
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
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

  Future<Product> deleteFavorite(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Product data;
    try {
      var response = await dio.delete(
        "$url/api/favorite/$id",
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = Product.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future<Product> addtoFavorite(var id, var userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Product data;
    try {
      var response = await dio.post(
        "$url/api/favorite/",
        data: {"product_id": id, "user_id": userId},
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = Product.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future<Cart> addtocart(var id,var qty) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Cart data;
    try {
      var response = await dio.post(
        "$url/api/addtocart/",
        data: {
          "product_id": id,
          "cart_prod_qty":qty
        },
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = Cart.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future<List<Cart>> getCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    List<Cart> data;
    try {
      var response = await dio.get(
        "$url/api/addtocart/",
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = (response.data as List).map((i) => Cart.fromJson(i)).toList();
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }
  Future<Cart> updateCartProducts(var id,var qty) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Cart data;
    try {
      var response = await dio.put(
        "$url/api/addtocart/$id",
         data: {
          "cart_prod_qty": qty,
        },
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = Cart.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

   Future<Cart> deleteCartProduct(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Cart data;
    try {
      var response = await dio.delete(
        "$url/api/addtocart/$id",
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = Cart.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }
}
