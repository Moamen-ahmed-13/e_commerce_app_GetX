import 'package:e_commerce_app/controller/auth_controler.dart';
import 'package:e_commerce_app/controller/view_controler.dart';
import 'package:e_commerce_app/view/auth_pages/login_page.dart';
import 'package:e_commerce_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthControler> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthControler>().getUser == null)
          ? LoginPage()
          : GetBuilder<ViewControler>(builder: (controller) {
              return Scaffold(
                body: controller.currentPage,
                bottomNavigationBar: _bottomNavigationBar(),
              );
            });
    });
  }
}

Widget _bottomNavigationBar() {
  return GetBuilder<ViewControler>(
      init: ViewControler(),
      builder: (controller) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Explore'),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/images/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Cart'),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/images/Icon_Cart.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Account'),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/images/Icon_User.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
              label: '',
            ),
          ],
          currentIndex: controller.navigationIndex,
          onTap: (index) {
            controller.setNavigationIndex(index);
          },
          showUnselectedLabels: false,
          backgroundColor: Colors.grey.shade100,
        );
      });
}
