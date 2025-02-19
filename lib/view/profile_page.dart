import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/controller/profile_controller.dart';
import 'package:e_commerce_app/view/auth_pages/login_page.dart';
import 'package:e_commerce_app/view/widgets/profile_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 65),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: primaryColor,
                                child: Text(
                                  '${controller.userModel.name?[0].toUpperCase()}${controller.userModel.name?[1].toUpperCase()}',
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 25),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.userModel.name}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${controller.userModel.email}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 70),
                          ProfileList(
                            title: 'Edit Profile',
                          ),
                          ProfileList(
                            title: 'Shipping Address',
                          ),
                          ProfileList(
                            title: 'Order History',
                          ),
                          ProfileList(
                            title: 'Cards',
                          ),
                          ProfileList(
                            title: 'Notifications',
                          ),
                          ProfileList(
                            title: 'Log Out',
                          ),
                        ],
                      ),
                    ),
                  ));
        });
  }
}
