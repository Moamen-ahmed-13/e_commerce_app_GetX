import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/controller/view_controler.dart';
import 'package:e_commerce_app/view/details_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_pages/login_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: Get.find<HomeController>(),
        builder: (controller) {
          return controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 100.0, horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _searchFormField(),
                          SizedBox(height: 30),
                          Text("Categories", style: TextStyle(fontSize: 22)),
                          SizedBox(height: 30),
                          _listViewCategory(),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Best Selling",
                                  style: TextStyle(fontSize: 18)),
                              Text("See all", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 30),
                          _listViewProducts(),
                        ],
                      ),
                    ),
                  ),
                );
        });
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Image.network(controller.categoryModel[index].image!),
                  ),
                ),
                SizedBox(height: 10),
                Text(controller.categoryModel[index].name!),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 20),
        ),
      );
    });
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        height: 350,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.bestSellingModel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => DetailsPage(
                      bestSellingModel: controller.bestSellingModel[index],
                    ));
              },
              child: Hero(
                tag: controller.bestSellingModel[index].image!,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            controller.bestSellingModel[index]
                                .image!, // Adjust the asset path if necessary
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          controller.bestSellingModel[index].name!,
                        ),
                      ), // Example price
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          maxLines: 1,
                          controller.bestSellingModel[index].description!,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ), // Example price
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "\$${controller.bestSellingModel[index].price!}", // Example item name
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 20),
        ),
      );
    });
  }

  Widget _searchFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade800,
          ),
          hintText: "Search for products...",
          hintStyle: TextStyle(color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
