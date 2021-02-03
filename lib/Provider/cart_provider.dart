import 'package:flutter/cupertino.dart';
import 'package:puri_fast_food/models/cart_model.dart';
import 'package:puri_fast_food/util/authentication/api_services.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _cartProduct = [];
  Map<int, int> _quantity = {};
  ApiService apiService = ApiService();
  List<Cart> get cartProduct => _cartProduct;
  Map<int, int> get quantity => _quantity;

  double get totalAmount {
    var total = 0.0;
    _cartProduct.forEach((cartItem) {
      total += cartItem.cartProdQty * cartItem.products.price;
    });
    return total;
  }

  void resetStreams() {
    apiService = ApiService();
    _cartProduct = List<Cart>();
  }

  removeProduct(var id) async {
    cartProduct.removeWhere((element) => element.productId == id);
    notifyListeners();
    await apiService.deleteCartProduct(id);
    fetchCartProduct();
  }

  fetchCartProduct() async {
    var cart = await apiService.getCartProducts();
    _cartProduct.addAll(cart);
    _cartProduct.forEach((element) {
      _quantity.putIfAbsent(element.productId, () => element.cartProdQty);
    });
    notifyListeners();
  }

  changeQty(var id, var qty) async {
    _quantity.update(id, (value) => qty);

    _cartProduct.forEach((cartItem) {
      cartItem.cartProdQty = _quantity[cartItem.productId];
    });

    notifyListeners();
    await apiService.updateCartProducts(id, qty);
    fetchCartProduct();
  }
}
