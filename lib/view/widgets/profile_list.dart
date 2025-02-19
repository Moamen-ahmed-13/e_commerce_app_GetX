import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset('assets/images/Icon_User.png'),
          title: Text(title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
