import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/view/auth_pages/login_page.dart';
import 'package:e_commerce_app/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
      ),
      home: Scaffold(
        body: ControlView(),
      ),
    );
  }
}
