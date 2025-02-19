import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/controller/checkout_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryTime extends StatefulWidget {
  const DeliveryTime({super.key});

  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  int _selectedDeliveryOption = 1;
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            deliveryMethod(1, 'Standard Delivery',
                '\nOrder will be delivered between 3-5 business days', context),
            const SizedBox(height: 50),
            deliveryMethod(
                2,
                'Next Day Delivery',
                '\nPlace your order before 6pm and your items will be delivered the next day',
                context),
            const SizedBox(height: 50),
            deliveryMethod(
                3,
                'Nominated Delivery',
                '\nPick a particular date from the calendar and order will be delivered on selected date',
                context),
            // RadioListTile<Delivery>(
            //   value: Delivery.StandardDelivery,
            //   groupValue: delivery,
            //   onChanged: (Delivery? value) {
            //     setState(() {
            //       delivery = value!;
            //     });
            //   },
            //   title: Text(
            //     'Standard Delivery',
            //   ),
            //   subtitle: const Text(
            //       '\nPick a particular date from the calendar and order will be delivered on selected date'),
            //   activeColor: primaryColor,
            // ),
          ],
        ),
      ),
    );
  }

  Widget deliveryMethod(
      int value, String title, String subtitle, BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                subtitle,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const Spacer(),
        Radio<int>(
            value: value,
            groupValue: _selectedDeliveryOption,
            onChanged: (int? newValue) {
              setState(() {
                _selectedDeliveryOption = newValue!;
              });
              // Get.find<CheckoutViewController>().changePageIndex(newValue!);
            },
            fillColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return primaryColor;
              } else {
                return Colors.grey;
              }
            })),
      ],
    );
  }
}
