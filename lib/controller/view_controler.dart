import 'package:e_commerce_app/view/cart_page.dart';
import 'package:e_commerce_app/view/home_page.dart';
import 'package:e_commerce_app/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewControler extends GetxController {
  int _navigationIndex = 0;
  Widget _currentPage = HomePage();

  get navigationIndex => _navigationIndex;

  get currentPage => _currentPage;
  void setNavigationIndex(int selectedIndex) {
    _navigationIndex = selectedIndex;

    switch (selectedIndex) {
      case 0:
        _currentPage = HomePage();
        break;
      case 1:
        _currentPage = CartPage();
        break;
      case 2:
        _currentPage = ProfilePage();
    }
    update();
  }
}
