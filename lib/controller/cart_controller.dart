import 'package:e_commerce_app/helper/cart_DB.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  var dbHelper = CartDbHelper.db;

  CartController() {
    getAllProducts();
  }

  getAllProducts() async {
    _loading.value = true;

    _cartProductModel = await dbHelper.getAllProduct();
    print(_cartProductModel.length);
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    _totalPrice = 0;
    for (var i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price!) *
          _cartProductModel[i].quantity!);
      print(_totalPrice);
      update();
    }
  }

  addProductToCart(CartProductModel product) async {
    for (var i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].id == product.id) {
        return;
      }
    }

    await dbHelper.insertProduct(product);
    _cartProductModel.add(product);
    _totalPrice += (double.parse(product.price!) * product.quantity!);

    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += (double.parse(_cartProductModel[index].price!));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;
    _totalPrice -= (double.parse(_cartProductModel[index].price!));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

   deleteProduct(CartProductModel product) async {
    await dbHelper.deleteProduct(product.id! as int);
    _cartProductModel.removeWhere((element) => element.id == product.id);
    getTotalPrice();
    update();
  }
}
