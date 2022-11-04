import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icontextfile.dart';
import 'container.dart';

const activeColor=Color(0xFF1D1E33);
const deactiveColor=Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecolor=deactiveColor;
  Color femaleColor=deactiveColor;
  void updateColor(int gender){
    if(gender==1){
      malecolor=activeColor;
      femaleColor=deactiveColor;
    }
    if(gender==2){
      malecolor=deactiveColor;
      femaleColor=activeColor;
    }

  }
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
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColor(1);
                  });
                },
                child: RepeatContainerCode(
                  colors: malecolor,
                    cardWidgets:RepeatTextandIconWidget(
                      iconData: FontAwesomeIcons.male,
                      label: 'Male',
                    )
                ),
              ), ),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColor(2);
                  });
                },
                child: RepeatContainerCode(
                  colors: femaleColor,
                  cardWidgets:RepeatTextandIconWidget(
                  iconData: FontAwesomeIcons.personDress,
                  label: 'Female',
                  ) ),
              )
              )

            ],
          ) ),
          Expanded(child: RepeatContainerCode(
            colors: Color(0xFF1D1E33),
            cardWidgets:RepeatTextandIconWidget(
            iconData: FontAwesomeIcons.male,
            label: 'Male',
          ),  )),
          Expanded(child: Row(
              children: [
              Expanded(child: RepeatContainerCode(
          colors: Color(0xFF1D1E33),
            cardWidgets:RepeatTextandIconWidget(
              iconData: FontAwesomeIcons.male,
              label: 'Male',

              ), ),),
              Expanded(child: RepeatContainerCode(
              colors: Color(0xFF1D1E33),
              cardWidgets:RepeatTextandIconWidget(
              iconData: FontAwesomeIcons.male,
              label: 'Male',
              ),)
                ) ])),

        ],

      ),


    );
  }
}



