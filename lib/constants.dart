import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(0, 197, 105, 1);
final String tableProduct = 'CartProduct';

final String columnName = 'name';
final String columnImage = 'image';
final String columnPrice = 'price';
final String columnQuantity = 'quantity';
final String columnId = 'id';

final String cachedUserData = 'user_data';

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  deliveryTime,
  addAddress,
  summary,
}

enum Delivery {
  StandardDelivery,
  NextDayDelivery,
  NominatedDelivery,
}