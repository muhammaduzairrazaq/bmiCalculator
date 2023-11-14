import 'package:bmi_calculator_app/constant.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  IconText({required this.icondata, required this.lable});
  final IconData icondata;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icondata,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          lable,
          style: labelStyle,
        )
      ],
    );
  }
}
