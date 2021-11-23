class Product {
  late String title;
  late String imageUrl;
  late String description;
  late int price;
  late String ingredient;
  late String id;
  late String color;

  Product(
      {required this.title,
        required this.imageUrl,
        required this.description,
        required this.price,
        required this.ingredient,
        required this.id,
        required this.color});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    price = json['price'];
    ingredient = json['ingredient'];
    id = json['id'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['price'] = this.price;
    data['ingredient'] = this.ingredient;
    data['id'] = this.id;
    data['color'] = this.color;
    return data;
  }
}