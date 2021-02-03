import 'package:puri_fast_food/models/product_model.dart';
class Cart {
  int id;
  int userId;
  int productId;
  int cartProdQty;
  String createdAt;
  String updatedAt;
  Product products;

  Cart(
      {this.id,
      this.userId,
      this.productId,
      this.cartProdQty,
      this.createdAt,
      this.updatedAt,
      this.products});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    cartProdQty = json['cart_prod_qty'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    products = json['products'] != null
        ? new Product.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['cart_prod_qty'] = this.cartProdQty;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products.toJson();
    }
    return data;
  }
}
