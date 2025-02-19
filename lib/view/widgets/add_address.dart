import 'package:e_commerce_app/controller/checkout_view_controller.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewController>(
        init: Get.find<CheckoutViewController>(),
        builder: (controller) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Billing address is the same as delevery address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      CustomTextFormField(
                        fieldName: 'Street 1',
                        hintText: '21, Alex Dev',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter street 1';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.street1 = value ??" ";
                        },
                        secured: false,
                      ),
                      SizedBox(height: 40),
                      CustomTextFormField(
                        fieldName: 'Street 2',
                        hintText: 'Opposite Omegatron, Vicent Quarters',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter street 2';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.street2 = value??" ";
                        },
                        secured: false,
                      ),
                      SizedBox(height: 40),
                      CustomTextFormField(
                        fieldName: 'City',
                        hintText: 'Victoria Island',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter city';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.city = value??" ";
                        },
                        secured: false,
                      ),
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              fieldName: 'State',
                              hintText: 'Lagos State',
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter state';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                controller.state = value??" ";
                              },
                              secured: false,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: CustomTextFormField(
                              fieldName: 'Country',
                              hintText: 'Nigeria',
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter country';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                controller.country = value??" ";
                              },
                              secured: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
