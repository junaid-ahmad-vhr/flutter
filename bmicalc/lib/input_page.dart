import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icontextfile.dart';
import 'container.dart';
import 'constentfile.dart';
import 'resultfile.dart';


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
  int sliderweight=60;
  int sliderAge=20;
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
                cardWidgets: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Weight',style: klabelstyle,),
                    Text(sliderweight.toString(),style: Knumberstyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Roundicon(
                           iconData:FontAwesomeIcons.minus ,
                          onPress: (){
                             setState(() {
                               sliderweight--;
                             });
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Roundicon(
                          iconData:FontAwesomeIcons.plus ,
                          onPress: (){
                            setState(() {
                              sliderweight++;
                            });
                          },
                        )

                      ],
                    )
                  ],

                ),
                onpressed: (){},
          colors: Color(0xFF1D1E33),
           ),),
              Expanded(child: RepeatContainerCode(
                onpressed: (){},
              colors: Color(0xFF1D1E33),
                cardWidgets: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Age',style: klabelstyle,),
                    Text(sliderAge.toString(),style: Knumberstyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Roundicon(
                          iconData:FontAwesomeIcons.minus ,
                          onPress: (){
                            setState(() {
                              sliderAge--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Roundicon(
                          iconData:FontAwesomeIcons.plus ,
                          onPress: (){
                            setState(() {
                              sliderAge++;
                            });
                          },
                        )

                      ],
                    )
                  ],

                ),)
                ),

              ])
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen()));

            },
            child: Container(
              child: Center(child: Text('Calculate',style: Klargebuttonstyle,)),
              color:Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 70.0,

            ),
          )

        ],

      ),


    );
  }
}

class Roundicon extends StatelessWidget {
Roundicon({required this.iconData, required this.onPress});
final IconData iconData;
final void Function()? onPress;



  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height:40.0,
        width:56.0,
      ),
      shape:CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}


