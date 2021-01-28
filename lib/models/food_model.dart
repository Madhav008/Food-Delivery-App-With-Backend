class Food {
  final String id;
  final String name;
  final String imagePath;
  final String catagory;
  final double price;
  final double discount;
  final double ratings;

  Food(
      {this.price,
      this.imagePath,
      this.catagory,
      this.discount,
      this.id,
      this.name,
      this.ratings});
}
