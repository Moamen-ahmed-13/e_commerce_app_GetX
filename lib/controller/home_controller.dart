import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/helper/services/home_service.dart';
import 'package:e_commerce_app/model/best_selling_model.dart';
import 'package:e_commerce_app/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;
  List<BestSellingModel> _bestSellingModel = [];
  List<BestSellingModel> get bestSellingModel => _bestSellingModel;

  HomeController() {
    getCategories();
    getBestSellingProducts();
  }

  Future<void> getCategories() async {
    try {
      _loading.value = true;
      HomeService().getCategories().then((value) {
        for (var i = 0; i < value.length; i++) {
          _categoryModel.add(
              CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
          _loading.value = false;
        }
        update();
      });
      // Notify UI of the change
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }

  Future<void> getBestSellingProducts() async {
    try {
      _loading.value = true;
      HomeService().getBestSelling().then((value) {
        for (var i = 0; i < value.length; i++) {
          _bestSellingModel.add(
            BestSellingModel.fromJson(value[i].data() as Map<String, dynamic>),
          );
          _loading.value = false;
        }
        update();
      });
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }
}
