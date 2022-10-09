import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(dicestate());
}


class dicestate extends StatefulWidget {
  const dicestate({Key? key}) : super(key: key);

  @override
  State<dicestate> createState() => _dicestateState();
}

class _dicestateState extends State<dicestate> {
  @override
  int num1=1;
  int num2=1;
  int num3=1;
  int num4=1;
  int sum1=0;
  int sum2=0;
  int sum3=0;
  int sum4=0;
  int c1=10;
  int c2=10;
  int c3=10;
  int c4=10;
  String m="Player 1 turn";
  result(){
    if(sum1>sum2 && sum1>sum3 && sum1>sum4){
      m="Player 1 WON ";
    }
    if(sum2>sum1 && sum2>sum3 && sum2>sum4){
      m="Player 2 WON ";
    }
    if(sum3>sum1 && sum3>sum2 && sum3>sum4){
      m="Player 3 WON ";
    }
    if(sum4>sum1 && sum4>sum2 && sum4>sum3){
      m="Player 4 WON ";
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child:Image(
                      image: AssetImage("assets/icon.png"),
                      fit: BoxFit.cover),
                ),


                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Horror Dice Game',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            backgroundColor: Colors.black87, //<-- SEE HERE

          ),
          body:
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/dd.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Container(
                  color: Colors.amberAccent,
                  height: 30,
                  width: double.infinity,
                  child: Text("$m",textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                      fontSize: 20),),),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      children: [
                        Text("Player 1",style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Open Sans',
                            fontSize: 30),),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(onPressed: (){
                          setState(() {
                            if(c2==10 && c3==10 && c4==10 && c1>0){
                              c1--;
                              Random random = new Random();
                              num1 = random.nextInt(6) + 1;
                              sum1=sum1+num1;
                              if(num1==6){
                               c1++;
                              }
                              print(num1);
                            }


                            if(c1==0){
                              m="player 2 turns";
                            }
                          });
                        }, child: Container(
                          height: 100,
                          width: 100,
                          child:Image(
                              image: AssetImage("assets/dice$num1.jpeg"),
                              fit: BoxFit.cover),
                        ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Number of terns = $c1",style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Open Sans',
                            fontSize: 15),),
                        Text("Score =$sum1",style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 15,),),
                      ],
                    ),

                    Column(
                      children: [
                        Text("Player 2",style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Open Sans',
                            fontSize: 30),),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(onPressed: (){
                          setState(() {
                            if(c1==0 && c3==10 && c4==10 && c2>0){
                              c2--;

                            Random random = new Random();
                             num2 = random.nextInt(6)+1;
                              sum2=sum2+num2;
                              if(num2==6){
                                c2++;
                              }
                            print(num2);
                            }
                            if(c2==0){
                              m="player 3 turns";
                            }

                          });
                        }, child: Container(
                          height: 100,
                          width: 100,
                          child:Image(
                              image: AssetImage("assets/dice$num2.jpeg"),
                              fit: BoxFit.cover),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Text("Number of tern = $c2",style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Open Sans',
                            fontSize: 15),),
                        Text("Score = $sum2",style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 15,),),
                      ],
                    ),
                  ],

                ),
               SizedBox(
                 height: 90,
               ),




                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      children: [
                        Text("Player 3",style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Open Sans',
                            fontSize: 30),),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(onPressed: (){
                          setState(() {
                            if((c2==0 && c1==0 && c4==10 && c3>0)) {
                              c3--;


                              Random random = new Random();
                              num3 = random.nextInt(6) + 1;
                              sum3=sum3+num3;
                              if(num3==6){
                                c3++;
                              }
                              print(num3);
                            }
                            if(c3==0){
                              m="player 4 turns";
                            }
                          });
                        }, child: Container(
                          height: 100,
                          width: 100,
                          child:Image(
                              image: AssetImage("assets/dice$num3.jpeg"),
                              fit: BoxFit.cover),
                        ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Number of tern = $c3",style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Open Sans',
                            fontSize: 15),),
                        Text("Score = $sum3",style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 15,),),
                      ],
                    ),

                    Column(
                      children: [
                        Text("Player 4",style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Open Sans',
                            fontSize: 30),),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(onPressed: (){
                          setState(() {
                            if((c2==0 && c3==0 && c1==0 && c4>0)){
                            Random random = new Random();
                            num4 = random.nextInt(6)+1;
                            sum4=sum4+num4;

                            c4--;
                            if(num4==6){
                              c4++;
                            }
                            print(num4);}
                            if(c4==0){
                              result();
                            }

                          }
                          );
                        }, child: Container(
                          height: 100,
                          width: 100,
                          child:Image(
                              image: AssetImage("assets/dice$num4.jpeg"),
                              fit: BoxFit.cover),
                        ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Number of tern = $c4",style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Open Sans',
                            fontSize: 15),),
                        Text("Score = $sum4",style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 15,),),
                      ],
                    ),
                  ],

                ),
              ],
            ),
          )

      ),
    );

  }
}

