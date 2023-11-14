import 'package:bmi_calculator_app/constant.dart';
import 'package:bmi_calculator_app/container.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Result'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'Your Result',
                    style: kTitleStyleS2,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ContainerWidget(
                colors: activeColor,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kTitleStyleS3,
                    ),
                    Text(
                      bmiResult,
                      style: kTitleStyleS2,
                    ),
                    Text(
                      interpretation,
                      style: kTitleStyleS4,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Recalculate',
                      style: labelStyle3,
                    ),
                  ),
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: 80.0,
                ),
              ),
            ),
          ],
        ));
  }
}
