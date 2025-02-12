import 'package:e_commerce_app/controller/auth_controler.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/controller/view_controler.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthControler() );
    Get.lazyPut(() => ViewControler() );
    Get.lazyPut(() => HomeController() );

  }
}