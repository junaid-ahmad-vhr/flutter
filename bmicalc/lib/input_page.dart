import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icontextfile.dart';
import 'container.dart';
import 'constentfile.dart';


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
  int sliderheight=180;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
              cardWidgets:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height",style: klabelstyle ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(sliderheight.toString(),style: Knumberstyle),
                      Text("cm",style: klabelstyle,)
                  ],),
                  Slider(value: sliderheight.toDouble()
                      ,min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor:Color(0xFF8D8E98),
                      onChanged: (double newvalue){
                    setState(() {
                      sliderheight=newvalue.round();
                    });
                      })
                ],
              ) )),
          Expanded(child: Row(
              children: [
              Expanded(child: RepeatContainerCode(
                cardWidgets: Column(),
                onpressed: (){},
          colors: Color(0xFF1D1E33),
           ),),
              Expanded(child: RepeatContainerCode(
                onpressed: (){},
              colors: Color(0xFF1D1E33),
              cardWidgets: Column())
                ) ])),

        ],

      ),


    );
  }
}



