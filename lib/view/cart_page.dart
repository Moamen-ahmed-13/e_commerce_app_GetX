import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/helper/cart_DB.dart';
import 'package:e_commerce_app/view/checkout/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: Get.find<CartController>(),
        builder: (controller) {
          return Scaffold(
            body: controller.cartProductModel.length == 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/empty-cart.svg",
                        height: 200,
                        width: 200,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          "Cart is empty",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                //deletion test
                                return Dismissible(
                                  key: Key(controller.cartProductModel[index]
                                      .toString()),
                                  background: Container(
                                    color: Colors.red,
                                    child: Icon(Icons.delete),
                                  ),
                                  onDismissed: (direction) async {
                                    direction == DismissDirection.endToStart;
                                    await controller.deleteProduct(
                                        controller.cartProductModel[index]);
                                        controller.update();
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        child: Image.network(
                                          controller
                                              .cartProductModel[index].image!,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .cartProductModel[index].name!,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            controller
                                                .cartProductModel[index].price!,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey.shade200,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () async {
                                                      controller
                                                          .increaseQuantity(
                                                              index);
                                                    },
                                                    child: Icon(Icons.add)),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  controller
                                                      .cartProductModel[index]
                                                      .quantity
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      controller
                                                          .decreaseQuantity(
                                                              index);
                                                    },
                                                    child: Icon(Icons.remove)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 15,
                                );
                              },
                              itemCount: controller.cartProductModel.length),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35.0, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TOTAL',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                GetBuilder<CartController>(
                                    init: Get.find<CartController>(),
                                    builder: (controller) {
                                      return Text(
                                        '${controller.totalPrice}\$',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      );
                                    }),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.to(CheckOutView());
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(150, 50),
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              child: Text(
                                "CHECKOUT",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        });
  }
}
