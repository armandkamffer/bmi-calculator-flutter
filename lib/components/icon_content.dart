import 'package:flutter/material.dart';

import '../ui_constants.dart';

class IconContent extends StatelessWidget {
  final String title;
  final IconData icon;

  IconContent({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}