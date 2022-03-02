import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../gender.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/reusable_number_input.dart';
import '../ui_constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _selectedGender;
  int height = 170;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    color: _selectedGender == Gender.male
                        ? kReusableCardColor
                        : kInactiveCardColor,
                    child: IconContent(
                      title: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                    onTap: () {
                      didTapGender(Gender.male);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    color: _selectedGender == Gender.female
                        ? kReusableCardColor
                        : kInactiveCardColor,
                    child: IconContent(
                      title: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                    onTap: () {
                      didTapGender(Gender.female);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              color: kReusableCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kLargeTextStyle,
                      ),
                      Text(
                        ' cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: kAccentColor,
                      activeTrackColor: Colors.white,
                      overlayColor: kAccentColor,
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 240,
                      onChanged: didChangeSlider,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ReusableNumberInput(
                    title: 'WEIGHT',
                    value: weight,
                    plusPressed: () {
                      setState(() {
                        weight++;
                      });
                    },
                    minusPressed: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableNumberInput(
                    title: 'AGE',
                    value: age,
                    plusPressed: () {
                      setState(() {
                        age++;
                      });
                    },
                    minusPressed: () {
                      setState(() {
                        age--;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              var calculator = BMICalculator(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calculator.calculateBMI(),
                    resultText: calculator.getResult(),
                    interpretation: calculator.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void didTapGender(Gender gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  void didChangeSlider(double newValue) {
    setState(() {
      height = newValue.toInt();
    });
  }
}
