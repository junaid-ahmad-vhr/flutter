import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icontextfile.dart';
import 'container.dart';

const activeColor=Color(0xFF1D1E33);
const deactiveColor=Color(0xFF111328);
enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender ? selectgender;
  // Color malecolor=deactiveColor;
  // Color femaleColor=deactiveColor;
  // void updateColor(Gender gendertype){
  //   if(gendertype==Gender.male){
  //     malecolor=activeColor;
  //     femaleColor=deactiveColor;
  //   }
  //   if(gendertype==Gender.female){
  //     malecolor=deactiveColor;
  //     femaleColor=activeColor;
  //   }
  //
  // }
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
              Expanded(
                child: RepeatContainerCode(
                  onpressed: (){
                    setState(() {
                      selectgender=Gender.male;
                    });

                  },
                  colors: selectgender==Gender.male?activeColor:deactiveColor,
                    cardWidgets:RepeatTextandIconWidget(

                      iconData: FontAwesomeIcons.male,
                      label: 'Male',
                    )
                ),

              ),
              Expanded(

                child: RepeatContainerCode(
                    onpressed: (){
                      setState(() {
                        selectgender=Gender.female;
                      });
                    },
                    colors: selectgender==Gender.female?activeColor:deactiveColor,
                  cardWidgets:RepeatTextandIconWidget(
                  iconData: FontAwesomeIcons.personDress,
                  label: 'Female',
                  ) ),

              )

            ],
          ) ),
          Expanded(child: RepeatContainerCode(
            onpressed: (){},
            colors: Color(0xFF1D1E33),
            cardWidgets:RepeatTextandIconWidget(
            iconData: FontAwesomeIcons.male,
            label: 'Male',
          ),  )),
          Expanded(child: Row(
              children: [
              Expanded(child: RepeatContainerCode(
                onpressed: (){},
          colors: Color(0xFF1D1E33),
            cardWidgets:RepeatTextandIconWidget(
              iconData: FontAwesomeIcons.male,
              label: 'Male',

              ), ),),
              Expanded(child: RepeatContainerCode(
                onpressed: (){},
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



