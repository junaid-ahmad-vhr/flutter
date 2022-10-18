import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:math';
void main() {
  runApp(const guessgame());
}

class guessgame extends StatefulWidget {
  const guessgame({Key? key}) : super(key: key);

  @override
  State<guessgame> createState() => _guessgameState();
}

class _guessgameState extends State<guessgame> {
  @override
  int z=0;
  int c=1;
  int num1=0;
  int num2=0;
  int num3=0;
  int bt1=0;
  int bt2=0;
  int bt3=0;
  int num4=0;
  Color r=Colors.red;
  Color w=Colors.white;
  Color g=Colors.green;
  Color r2=Colors.red;
  Color w2=Colors.white;
  Color g2=Colors.green;
  Color r3=Colors.red;
  Color w3=Colors.white;
  Color g3=Colors.green;
  String m="GUESS GAME";
  bool isPressed= false;

  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child:Image(
                      image: AssetImage("assets/icon.jpg"),
                      fit: BoxFit.cover),
                ),


                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'matching game',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            backgroundColor: Colors.purpleAccent, //<-- SEE HERE

          ),
          body: Container(

              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bas.jpg"),
                    fit: BoxFit.cover),
              ),
              child:Column(


                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    color: Colors.amberAccent,
                    height: 30,
                    width: 200,
                    child: Text("$m",textAlign: TextAlign.center,style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 15),),),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          Random random = new Random();
                          num1 = random.nextInt(10) + 1;
                          print(num1);
                          Random random2 = new Random();
                          num2 = random2.nextInt(10) + 1;
                          print(num2);
                          Random random3 = new Random();
                          num3 = random3.nextInt(10) + 1;
                          print(num3);
                          Random priority = new Random();
                          num4 = priority.nextInt(3) + 1;
                          print(num4);
                          m="Range of Number is 1-10";
                          z=1;

                          if(num4==1){
                            setState(() {

                              bt1=num2;
                              bt2=num3;
                              bt3=num1;
                            });

                          }
                          if(num4==2){
                            setState(() {

                              bt1=num1;
                              bt2=num2;
                              bt3=num3;
                            });
                          }
                          if(num4==3) {
                            setState(() {
                              bt1 = num3;
                              bt2 = num1;
                              bt3 = num2;
                            });
                          };
                        },
                        child: Text("genrate random number"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(

                          onPressed: (){
                        if(c==1){
                          setState(() {

                            num1=0;
                            num2=0;
                            num3=0;
                            bt1=0;
                            bt2=0;
                            bt3=0;
                            num4=0;
                            m="GUESS GAME";
                            w=Colors.white;
                            w2=Colors.white;
                            w3=Colors.white;

                          });

                        }

                      },
                          child: Text("reset"))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    color: w,
                    child: TextButton(

                      onPressed: (){
                        if(z==1) {
                          if (bt1 == num1) {
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/correct.wav"),

                            );

                            setState(() {
                              w = g;
                            });
                            print("ok");
                          }
                          else {
                            print("wrong");
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/wrong.wav"),

                            );
                            setState(() {
                              w = r;
                              if (bt2 == num1) {
                                setState(() {
                                  w2 = g2;
                                });
                              }
                              else if (bt3 == num1) {
                                setState(() {
                                  w3 = g3;
                                });
                              }
                            });
                            print("ok");
                          }
                        }
                      },
                      child: Text("i)  $bt1"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    color: w2,
                    child: TextButton(
                      onPressed: (){
                        if(z==1) {
                          if (bt2 == num1) {
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/correct.wav"),

                            );
                            setState(() {
                              w2 = g2;
                            });
                            print("ok");
                          }


                          else {
                            print("wrong");
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/wrong.wav"),


                            );

                            setState(() {
                              w2 = r2;
                              if (bt3 == num1) {
                                setState(() {
                                  w3 = g3;
                                });
                              }
                              else if (bt1 == num1) {
                                setState(() {
                                  w = g;
                                });
                              }
                            });
                            print("ok");
                          }
                        }
                      },
                      child: Text("ii)  $bt2"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    color: w3,
                    child: TextButton(
                      onPressed: (){
                        if(z==1) {
                          if (bt3 == num1) {
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/correct.wav"),

                            );
                            setState(() {
                              w3 = g3;
                            });
                            print("correct");
                          }
                          else {
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/wrong.wav"),

                            );
                            setState(() {
                              w3 = r3;
                              if (bt2 == num1) {
                                setState(() {
                                  w2 = g2;
                                });
                              }
                              else if (bt1 == num1) {
                                setState(() {
                                  w = g;
                                });
                              }
                            });
                            print("ok");
                          }
                        }
                      },
                      child: Text("iii)  $bt3"),
                    ),
                  )

  ]
        )
        )
    )
    );

  }
}

