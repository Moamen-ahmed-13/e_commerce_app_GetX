class CartProductModel {
  String? name, image, price, id;
  late int quantity;
  CartProductModel(
      {this.name, this.image, this.price, this.quantity = 1, this.id});

  CartProductModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return;
    }
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
  }
  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }
}
