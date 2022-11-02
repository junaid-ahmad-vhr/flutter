import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: RepeatContainerCode(
                colors: Color(0xFF1D1E33),
                  cardWidgets:RepeatTextandIconWidget(
                    iconData: FontAwesomeIcons.male,
                    label: 'Male',
                  )
              ), ),
              Expanded(child: RepeatContainerCode(
                colors: Color(0xFF1D1E33),
                cardWidgets:RepeatTextandIconWidget(
                iconData: FontAwesomeIcons.female,
                label: 'Female',
                ) )

            ],
          ) ),
          Expanded(child: RepeatContainerCode(
            colors: Color(0xFF1D1E33),
          ),  ),
          Expanded(child: Row(
              children: [
              Expanded(child: RepeatContainerCode(
                colors: Colors.lightBlue,
              ), ),
              Expanded(child: RepeatContainerCode(
                colors: Color(0xFF1D1E33),
              ),
                ) ])),


        ],

      ),


    );
  }
}

class RepeatTextandIconWidget extends StatelessWidget {
  RepeatTextandIconWidget({required this.iconData,this.label});
  final IconData iconData;
  final String  label;

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

class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({required this.colors,required this.cardWidgets,});
 final Color   colors;
 final Widget  cardWidgets;


  @override
  Widget build(BuildContext context) {

    return Container(

      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}