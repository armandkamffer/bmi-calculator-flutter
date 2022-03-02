import 'package:flutter/material.dart';

import '../ui_constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.title});

  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kAccentColor,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
      ),
      onTap: onTap,
    );
  }
}