import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/controller/checkout_view_controller.dart';
import 'package:e_commerce_app/finish_view.dart';
import 'package:e_commerce_app/view/widgets/add_address.dart';
import 'package:e_commerce_app/view/widgets/delevery_time.dart';
import 'package:e_commerce_app/view/widgets/summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

class CheckOutView extends StatelessWidget {
  final _processes = [
    'Delivery',
    'Address',
    'Summary',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewController>(
        init: CheckoutViewController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_new)),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: const Text(
                "CheckOut",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: StatusChange.tileBuilder(
                    theme: StatusChangeThemeData(
                      direction: Axis.horizontal,
                      connectorTheme:
                          const ConnectorThemeData(space: 1.0, thickness: 1.0),
                    ),
                    builder: StatusChangeTileBuilder.connected(
                      itemWidth: (_) =>
                          MediaQuery.of(context).size.width / _processes.length,
                      contentWidgetBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                        );
                      },
                      nameWidgetBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            _processes[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: controller.getColor(index),
                            ),
                          ),
                        );
                      },
                      indicatorWidgetBuilder: (_, index) {
                        if (index <= controller.processIndex) {
                          return DotIndicator(
                            size: 35.0,
                            border: Border.all(color: primaryColor, width: 1),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const OutlinedDotIndicator(
                            size: 30,
                            borderWidth: 1.0,
                            color: todoColor,
                          );
                        }
                      },
                      lineWidgetBuilder: (index) {
                        if (index > 0) {
                          if (index == controller.processIndex) {
                            final prevColor = controller.getColor(index - 1);
                            final nextColor = (index + 1 <
                                    _processes.length) // Prevent index error
                                ? controller.getColor(index + 1)
                                : prevColor;

                            return DecoratedLineConnector(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [prevColor, nextColor],
                                ),
                              ),
                            );
                          } else {
                            return SolidLineConnector(
                              color: controller.getColor(index),
                            );
                          }
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                      itemCount: _processes.length,
                    ),
                  ),
                ),
                if (controller.pages == Pages.deliveryTime)
                  const DeliveryTime()
                else if (controller.pages == Pages.addAddress)
                  const AddAddress()
                else
                  const SummaryWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.processIndex > 0) {
                              controller
                                  .changePageIndex(controller.processIndex - 1);
                            } else {
                              Get.back(); // Go back if on first step
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(170, 50),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          child: Text(
                            "Back",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            controller
                                .changePageIndex(controller.processIndex + 1);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(170, 50),
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });
  }
}
