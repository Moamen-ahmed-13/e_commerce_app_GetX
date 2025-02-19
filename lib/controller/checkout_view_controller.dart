import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewController extends GetxController {
  int _processIndex = 0;
  int get processIndex => _processIndex;

  Pages _pages = Pages.deliveryTime;
  Pages get pages => _pages;

  String? street1, street2, city, state, country;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changePageIndex(int i) {
    if (i == 0 || i < 0) {
      _pages = Pages.deliveryTime;
      _processIndex = 0; // ✅ Ensure process index resets correctly
    } else if (i == 1) {
      _pages = Pages.addAddress;
      _processIndex = 1; // ✅ Ensure correct page index
    } else if (i == 2) {
      if (formKey.currentState != null) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          _pages = Pages.summary;
          _processIndex = 2; // ✅ Update index when moving to summary
        } else {
          return; // Stops movement if validation fails
        }
      }
    } else if (i == 3) {
      Get.off(ControlView());
      _pages = Pages.deliveryTime;
      _processIndex = 0;
    }

    update(); // ✅ Refresh UI after index change
  }

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return Colors.teal;
    } else {
      return todoColor;
    }
  }
}
