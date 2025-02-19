import 'package:e_commerce_app/helper/color_extention.dart';
import 'package:flutter/material.dart';

class BestSellingModel {
  String? image, name, description, price, sized, id;

  BestSellingModel({
    this.image,
    this.name,
    this.description,
    this.price,
    this.sized,
    this.id,
  });
  Color? color;

  BestSellingModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return;
    }
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    sized = json['sized'];
    color = HexColor.fromHex(json['color']);
  }
  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['sized'] = this.sized;
    data['color'] = this.color;
    data['id'] = this.id;
    return data;
  }
}
