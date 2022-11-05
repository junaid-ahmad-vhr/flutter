import 'package:flutter/material.dart';
import 'constentfile.dart';
import 'container.dart';
import 'input_page.dart';
class ResultScreen extends StatelessWidget {
  ResultScreen({required this.interpretation,required this.bmiResult,required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),

      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        children: [
          Expanded(child: Container(
            child: Center(
              child: Text('Your Result',style: Ktittlestyle2,),
            ),
          )),
          Expanded(
              flex: 5,
              child: RepeatContainerCode(
                onpressed: (){},
                colors: activeColor,
                cardWidgets: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center ,
                  children: [
                    Text(resultText.toUpperCase(),style: kResultTextStyle,),
                    Text(bmiResult,style: kBMITextStyle,),
                    Text(interpretation ,textAlign: TextAlign.center, style: kBodyTextStyle,
                    ),

                  ],
                ),
              )
          ),
          Expanded(child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));

            },
            child: Container(
              child: Center(child: Text('ReCalculate',style: Klargebuttonstyle,)),
              color:Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 70.0,

            ),
          )),


        ],
      )
    );
  }
}
