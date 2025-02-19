import 'package:e_commerce_app/controller/local_storage_controller.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
ValueNotifier<bool> _isLoading = ValueNotifier(false);
ValueNotifier<bool> get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }


  final LocalStorageController localStorageController =
      Get.find<LocalStorageController>();

  late UserModel _userModel;
  UserModel get userModel => _userModel;

  void getCurrentUser() async {
    _isLoading.value = true;
    UserModel? user = await localStorageController.getUser;
    if (user != null) {
      _userModel = user;
      _isLoading.value = false;
      update();
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    localStorageController.removeUser();
  }
}
