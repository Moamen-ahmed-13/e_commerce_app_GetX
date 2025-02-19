import 'package:e_commerce_app/controller/auth_controler.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/controller/checkout_view_controller.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/controller/local_storage_controller.dart';
import 'package:e_commerce_app/controller/profile_controller.dart';
import 'package:e_commerce_app/controller/view_controler.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthControler() );
    Get.lazyPut(() => ViewControler() );
    Get.lazyPut(() => HomeController() );
    Get.lazyPut(() => CartController() );
    Get.lazyPut(() => LocalStorageController() );
    Get.lazyPut(() => ProfileController() );
    Get.lazyPut(() => CheckoutViewController() );

  }
}