import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Color colors;
  final Widget cardWidget;
  final VoidCallback? onPressed;
  ContainerWidget({required this.colors, required this.cardWidget, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
    child:Container(
      margin: EdgeInsets.all(15.0),
      child: cardWidget,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    );
  } 
}
