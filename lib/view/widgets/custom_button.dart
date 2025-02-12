import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.image, required this.text, required this.onPressed});
  final String image;
  final String text;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 20),
          Image.asset(image),
          SizedBox(width: 50),
          Text(
            text,
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }
}
