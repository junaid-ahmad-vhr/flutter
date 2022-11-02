import 'package:flutter/material.dart';

class RepeatTextandIconWidget extends StatelessWidget {
  RepeatTextandIconWidget({required this.iconData,this.label});
  final IconData iconData;
  final String   label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 85.0,

        ),
        SizedBox(
          height: 20.0,
        ),
        Text(label,style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98)
        ),)
      ],
    );
  }
}