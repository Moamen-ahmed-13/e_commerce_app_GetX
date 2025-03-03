import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/model/best_selling_model.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, this.bestSellingModel});
  BestSellingModel? bestSellingModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_new)),
              pinned: true,
              expandedHeight: 250,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                    tag: bestSellingModel!.image!,
                    child: Image.network(bestSellingModel!.image!,
                        fit: BoxFit.contain)),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.star_border, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bestSellingModel!.name!,
                      style: TextStyle(fontSize: 26),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side:
                                        BorderSide(color: Colors.grey.shade300),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                    ))),
                                onPressed: () {},
                                child: Text(
                                  "Size",
                                  style: TextStyle(color: Colors.black),
                                )),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size(70, 40),
                                  side: BorderSide(color: Colors.grey.shade300),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        bottomRight: Radius.circular(25)),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "XL",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(200, 40),
                                side: BorderSide(color: Colors.grey.shade300),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Color",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(width: 50),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: bestSellingModel!.color!,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Description', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    Text(
                      bestSellingModel!.description!,
                      style: TextStyle(fontSize: 16, height: 1.8),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Price",
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text(
                  "\$${bestSellingModel!.price}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ],
            ),
            GetBuilder<CartController>(
                init: CartController(),
                builder: (controller) {
                  return ElevatedButton(
                    onPressed: () {
                      controller.addProductToCart(
                        CartProductModel(
                          name: bestSellingModel!.name,
                          image: bestSellingModel!.image,
                          price: bestSellingModel!.price,
                          quantity: 1,
                          id: bestSellingModel!.id,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    child: Text(
                      "Add to cart",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
