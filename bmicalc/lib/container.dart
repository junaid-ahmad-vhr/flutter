import 'package:flutter/material.dart';
class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({required this.colors,required this.cardWidgets,});
  final Color   colors;
  final Widget  cardWidgets;


  @override
  Widget build(BuildContext context) {

    return Container(

      margin: EdgeInsets.all(15.0),
      child: cardWidgets,
      decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}