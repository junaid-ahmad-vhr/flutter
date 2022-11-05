import 'package:flutter/material.dart';
class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({required this.colors,required this.cardWidgets,required this.onpressed,});
  final Color   colors;
  final Widget  cardWidgets;
final void Function()?  onpressed;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onpressed,
      child: Container(

        margin: EdgeInsets.all(15.0),
        child: cardWidgets,
        decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}