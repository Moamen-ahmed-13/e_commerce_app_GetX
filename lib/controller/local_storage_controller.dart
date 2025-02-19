import 'dart:convert';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageController extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel? userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString(cachedUserData);
    return userData != null ? UserModel.fromJson(json.decode(userData)) : null;
  }

  setUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(cachedUserData, json.encode(user.toJson()));
  }

  removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(cachedUserData);
    
  }
}
