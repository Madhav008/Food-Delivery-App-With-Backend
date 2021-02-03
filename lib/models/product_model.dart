class Product {
  int id;
  String name;
  String image_url;
  String description;
  int restaurantId;
  int categoryId;
  int price;
 

  Product(
      {this.id,
      this.name,
      this.image_url,
      this.description,
      this.restaurantId,
      this.categoryId,
      this.price});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image_url = json['image_url'];
    description = json['description'];
    restaurantId = json['restaurant_id'];
    categoryId = json['category_id'];
    price = json['price'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url']= this.image_url;
    data['description'] = this.description;
    data['restaurant_id'] = this.restaurantId;
    data['category_id'] = this.categoryId;
    data['price'] = this.price;
    return data;
  }
}
