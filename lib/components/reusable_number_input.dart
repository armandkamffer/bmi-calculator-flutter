import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable_card.dart';
import 'round_icon_button.dart';
import '../ui_constants.dart';

class ReusableNumberInput extends StatelessWidget {
  ReusableNumberInput({this.title, this.value, this.plusPressed, this.minusPressed});

  final String title;
  final int value;
  final Function plusPressed;
  final Function minusPressed;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kReusableCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: kLabelTextStyle,
          ),
          Text(
            value.toString(),
            style: kLargeTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: minusPressed,
              ),
              SizedBox(
                width: 10.0,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: plusPressed,
              ),
            ],
          )
        ],
      ),
    );
  }
}
