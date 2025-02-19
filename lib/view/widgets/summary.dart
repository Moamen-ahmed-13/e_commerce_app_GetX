import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/controller/checkout_view_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartController>(
          init: Get.find<CartController>(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 280,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 180,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .cartProductModel[index].image!),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text:
                                      "${controller.cartProductModel[index].name!}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                  "\$${controller.cartProductModel[index].price!}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor)),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      itemCount: controller.cartProductModel.length,
                    ),
                  ),
                  Text(
                    'Shipping Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  GetBuilder<CheckoutViewController>(
                    init: Get.find<CheckoutViewController>(),
                    builder: (controller) {
                      return Text(
                        '\n' +
                            (controller.street1 ?? 'N/A') + ', ' +
      (controller.street2 ?? 'N/A') + ', ' +
      (controller.city ?? 'N/A') + ', ' +
      (controller.state ?? 'N/A') + ', ' +
      (controller.country ?? 'N/A'),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
