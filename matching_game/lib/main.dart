import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const matchinggame());
}
class matchinggame extends StatelessWidget {
  const matchinggame({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black,
                Colors.red,
                Colors.white,
                Colors.black,
              ],
            )
        ),
        child:  AnimatedSplashScreen.withScreenFunction(
            duration: 3000,
            splash: 'assets/icon.png',
            screenFunction: () async{
              return homepage();
            },
            splashTransition: SplashTransition.rotationTransition,
            backgroundColor: Colors.transparent

        ),

      ),
      );



  }
}
class gameover extends StatefulWidget {
  const gameover({Key? key}) : super(key: key);

  @override
  State<gameover> createState() => _gameoverState();
}

class _gameoverState extends State<gameover> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          children: [
            Container(
              width: 500,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/lose.gif"),
                    fit: BoxFit.cover),
              ),

            ),

            ElevatedButton(
              child: Text("play again"),
              onPressed: () {
                AssetsAudioPlayer.newPlayer().open(
                  Audio("assets/mixkit-magic-festive-melody-2986.wav"),

                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const homepage()),
                );
              },


              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 100),
                shape: const CircleBorder(),
                backgroundColor: Colors.red,
              ),
            ),

          ],
        )

        )

      );

  }
}
class win extends StatefulWidget {
  const win({Key? key}) : super(key: key);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/win.gif"),
                fit: BoxFit.cover),
          ),
            child:  Center(
    child:  Container(
    width: 500,
    height: 300,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/win2.gif"),
    fit: BoxFit.cover),
    ),

            ),


    )



            ),

          )
    );




  }
}

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
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
                    image: AssetImage("assets/icon.png"),
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
          backgroundColor: Colors.black87, //<-- SEE HERE

        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black,
                    Colors.red,
                    Colors.white,
                    Colors.black,
                  ],
                )
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child:Column(

                children: [
                  Container(
                    color: Colors.amberAccent,
                    height: 30,
                    width: double.infinity,
                    child: Text("Level 2",textAlign: TextAlign.center,style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 20),),),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/f10.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          hand10=1;
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/8.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          num8=1;
                          result8();
                          if(c1==10){
                            c1=0;
                            c2=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-medieval-show-fanfare-announcement-226.wav"),

                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const win()),
                            );
                          }
                          if(c2==3){
                            c2=0;
                            c1=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const gameover()),
                            );
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),

                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/f7.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          hand7=1;
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/9.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          num9=1;
                          result9();
                          if(c1==10){
                            c1=0;
                            c2=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-medieval-show-fanfare-announcement-226.wav"),

                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const win()),
                            );
                          }
                          if(c2==3){
                            c2=0;
                            c1=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const gameover()),
                            );
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),

                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/f8.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          hand8=1;
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/6.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          num6=1;
                          result6();
                          if(c1==10){
                            c1=0;
                            c2=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-medieval-show-fanfare-announcement-226.wav"),

                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const win()),
                            );
                          }
                          if(c2==3){
                            c2=0;
                            c1=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const gameover()),
                            );
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),

                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/f6.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          hand6=1;
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/10.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          num10=1;
                          result10();
                          if(c1==10){
                            c1=0;
                            c2=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-medieval-show-fanfare-announcement-226.wav"),

                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const win()),
                            );
                          }
                          if(c2==3){
                            c2=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const gameover()),
                            );
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),

                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/f9.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          hand9=1;
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/7.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          num7=1;
                          result7();
                          if(c1==10){
                            c1=0;
                            c2=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-medieval-show-fanfare-announcement-226.wav"),

                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const win()),
                            );
                          }
                          if(c2==3){
                            c2=0;
                            c1=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const gameover()),
                            );
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),

                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/f2.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          hand2=1;
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/4.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          num4=1;
                          result4();
                          if(c1==10){
                            c1=0;
                            c2=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-medieval-show-fanfare-announcement-226.wav"),

                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const win()),
                            );
                          }
                          if(c2==3){
                            c2=0;
                            c1=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const gameover()),
                            );
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),

                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/f5.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          hand5=1;
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/1.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          num1=1;
                          result1();
                          if(c1==10){
                            c1=0;
                            c2=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-medieval-show-fanfare-announcement-226.wav"),

                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const win()),
                            );
                          }
                          if(c2==3){
                            c2=0;
                            c1=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const gameover()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),

                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/f3.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          hand3=1;
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/5.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          num5=1;
                          result5();
                          if(c1==10){
                            c2=0;
                            c1=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-medieval-show-fanfare-announcement-226.wav"),

                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const win()),
                            );
                          }
                          if(c2==3){
                            c2=0;
                            c1=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const gameover()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),

                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/f1.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          hand1=1;
                        },

                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(

                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/2.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          num2=1;
                          result2();
                          if(c1==10){
                            c2=0;
                            c1=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-medieval-show-fanfare-announcement-226.wav"),

                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const win()),
                            );
                          }
                          if(c2==3){
                            c2=0;
                            c1=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const gameover()),
                            );
                          }




                        },

                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),

                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/f4.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          hand4=1;
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        child: CircleAvatar(
                          radius: 130,
                          backgroundColor: Colors.transparent,

                          child: ClipOval(
                            child: Image.asset("assets/3.jpeg",
                            ),


                          ),
                        ),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                          );
                          num3=1;
                          result3();
                          if(c1==10){
                            c1=0;
                            c2=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-medieval-show-fanfare-announcement-226.wav"),

                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const win()),
                            );
                          }
                          if(c2==3){
                            c2=0;
                            c1=0;
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const gameover()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 100),
                          backgroundColor: Colors.black,
                          shape: const CircleBorder(),
                        ),
                      ),

                    ],

                  ),

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}


class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}
int hand1=0;
int hand2=0;
int hand3=0;
int hand4=0;
int hand5=0;
int hand6=0;
int hand7=0;
int hand8=0;
int hand9=0;
int hand10=0;
int num1=0;
int num2=0;
int num3=0;
int num4=0;
int num5=0;
int num6=0;
int num7=0;
int num8=0;
int num9=0;
int num10=0;
int c1=0;
int c2=0;
String m=" Game started";


result1(){
  if(hand1==1 && num1==1) {
    c1 = c1 + 1;
    m="correct matching";
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-correct-positive-answer-949.wav"),

    );

     hand1=0;
     hand2=0;
     hand3=0;
    hand4=0;
    hand5=0;
    num1=0;
     num2=0;
     num3=0;
     num4=0;
    num5=0;
  }
  else if(hand1!=1 && num1==1){
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-funny-fail-low-tone-2876.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    c2= c2 + 1;
    m="wrong matching";
  }
}

result6(){
  if(hand6==1 && num6==1) {
    c1 = c1 + 1;
    m="correct matching";
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-correct-positive-answer-949.wav"),

    );

    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    hand6=0;
    hand7=0;
    hand8=0;
    hand9=0;
    hand10=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    num6=0;
    num7=0;
    num8=0;
    num9=0;
    num10=0;
  }
  else if(hand6!=1 && num6==1){
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-funny-fail-low-tone-2876.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    hand6=0;
    hand7=0;
    hand8=0;
    hand9=0;
    hand10=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    num6=0;
    num7=0;
    num8=0;
    num9=0;
    num10=0;
    c2= c2 + 1;
    m="wrong matching";
  }
}
result7(){
  if(hand7==1 && num7==1) {
    c1 = c1 + 1;
    m="correct matching";
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-correct-positive-answer-949.wav"),

    );

    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    hand6=0;
    hand7=0;
    hand8=0;
    hand9=0;
    hand10=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    num6=0;
    num7=0;
    num8=0;
    num9=0;
    num10=0;
  }
  else if(hand7!=1 && num7==1){
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-funny-fail-low-tone-2876.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    hand6=0;
    hand7=0;
    hand8=0;
    hand9=0;
    hand10=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    num6=0;
    num7=0;
    num8=0;
    num9=0;
    num10=0;
    c2= c2 + 1;
    m="wrong matching";
  }
}
result8(){
  if(hand8==1 && num8==1) {
    c1 = c1 + 1;
    m="correct matching";
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-correct-positive-answer-949.wav"),

    );

    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    hand6=0;
    hand7=0;
    hand8=0;
    hand9=0;
    hand10=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    num6=0;
    num7=0;
    num8=0;
    num9=0;
    num10=0;
  }
  else if(hand8!=1 && num8==1){
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-funny-fail-low-tone-2876.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    hand6=0;
    hand7=0;
    hand8=0;
    hand9=0;
    hand10=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    num6=0;
    num7=0;
    num8=0;
    num9=0;
    num10=0;
    c2= c2 + 1;
    m="wrong matching";
  }
}
result9(){
  if(hand9==1 && num9==1) {
    c1 = c1 + 1;
    m="correct matching";
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-correct-positive-answer-949.wav"),

    );

    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    hand6=0;
    hand7=0;
    hand8=0;
    hand9=0;
    hand10=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    num6=0;
    num7=0;
    num8=0;
    num9=0;
    num10=0;
  }
  else if(hand9!=1 && num9==1){
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-funny-fail-low-tone-2876.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    hand6=0;
    hand7=0;
    hand8=0;
    hand9=0;
    hand10=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    num6=0;
    num7=0;
    num8=0;
    num9=0;
    num10=0;
    c2= c2 + 1;
    m="wrong matching";
  }
}
result10(){
  if(hand10==1 && num10==1) {
    c1 = c1 + 1;
    m="correct matching";
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-correct-positive-answer-949.wav"),

    );

    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    hand6=0;
    hand7=0;
    hand8=0;
    hand9=0;
    hand10=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    num6=0;
    num7=0;
    num8=0;
    num9=0;
    num10=0;
  }
  else if(hand10!=1 && num6==10){
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-funny-fail-low-tone-2876.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    hand6=0;
    hand7=0;
    hand8=0;
    hand9=0;
    hand10=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    num6=0;
    num7=0;
    num8=0;
    num9=0;
    num10=0;
    c2= c2 + 1;

  }
}
result2(){
  if(hand2==1 && num2==1) {
    c1 = c1 + 1;
    m="correct matching";
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-correct-positive-answer-949.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
  }
  else if(hand2!=1 && num2==1){
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-funny-fail-low-tone-2876.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    c2= c2 + 1;
    m="wrong matching";
  }
}
result3(){
  if(hand3==1 && num3==1) {
    c1 = c1 + 1;
    m="correct matching";
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-correct-positive-answer-949.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
  }
  else if(hand3!=1 && num3==1){
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-funny-fail-low-tone-2876.wav"),

    );
    c2= c2 + 1;
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
  }
}
result4(){
  if(hand4==1 && num4==1) {
    m="correct matching";
    c1 = c1 + 1;
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-correct-positive-answer-949.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
  }
  else if(hand4!=1 && num4==1){
    m="wrong matching";
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-funny-fail-low-tone-2876.wav")

    );
    c2= c2 + 1;
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;

  }
}
result5(){
  if(hand5==1 && num5==1) {
    m="correct matching";
    c1 = c1 + 1;
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-correct-positive-answer-949.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
  }
  else if(hand5!=1 && num5==1){
    m="wrong matching";
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/mixkit-funny-fail-low-tone-2876.wav"),

    );
    hand1=0;
    hand2=0;
    hand3=0;
    hand4=0;
    hand5=0;
    num1=0;
    num2=0;
    num3=0;
    num4=0;
    num5=0;
    c2= c2 + 1;

  }
}

class _homepageState extends State<homepage> {
  @override

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
                    image: AssetImage("assets/icon.png"),
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
          backgroundColor: Colors.black87, //<-- SEE HERE

        ),
        body:
            SingleChildScrollView(
        child:
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black,
                  Colors.red,
                  Colors.white,
                  Colors.black,
                ],
              )
          ),
          child: Padding(
    padding: EdgeInsets.all(15),
    child:Column(

            children: [
              Container(
                color: Colors.amberAccent,
                height: 30,
                width: double.infinity,
                 child: Text("Level 1  ",textAlign: TextAlign.center,style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 20),),),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              ElevatedButton(
              child: CircleAvatar(
                radius: 130,
                backgroundColor: Colors.transparent,

                    child: ClipOval(
                      child: Image.asset("assets/f2.jpeg",
                      ),


                ),
              ),
          onPressed: () {
                hand2=1;
                AssetsAudioPlayer.newPlayer().open(
                  Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                );
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 100),
              shape: const CircleBorder(),
            backgroundColor: Colors.black,
        ),
      ),
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/4.jpeg",
                        ),


                      ),
                    ),
                    onPressed: () {
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                      );
                      num4=1;
                      result4();
                      if(c1==5){
                        c1=0;
                        c2=0;
                        AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/mixkit-game-level-completed-2059.wav"),

                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const page2()),
                        );
                      }
                      if(c2==3){
                        c1=0;
                        c2=0;
                        AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const gameover()),
                        );
                      }

                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.black,
                    ),
                  ),

                ],

              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/f5.jpeg",
                        ),


                      ),
                    ),
                    onPressed: () {
                      hand5=1;
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/1.jpeg",
                        ),


                      ),
                    ),
                    onPressed: () {
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                      );
                      num1=1;
                      result1();
                      if(c1==5){
                        c1=0;
                        c2=0;
                        AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/mixkit-game-level-completed-2059.wav"),

                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const page2()),
                        );
                      }
                      if(c2==3){
                        c2=0;
                        c1=0;
                        AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const gameover()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.black,
                    ),
                  ),

                ],

              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/f3.jpeg",
                        ),


                      ),
                    ),
                    onPressed: () {
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                      );
                      hand3=1;
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/5.jpeg",
                        ),


                      ),
                    ),
                    onPressed: () {
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                      );
                      num5=1;
                      result5();
                      if(c1==5){
                        c1=0;
                        c2=0;
                        AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/mixkit-game-level-completed-2059.wav"),

                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const page2()),
                        );
                      }
                      if(c2==3){
                        c2=0;
                        c1=0;
                        AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const gameover()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.black,
                    ),
                  ),

                ],

              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/f1.jpeg",
                        ),


                      ),
                    ),
                    onPressed: () {
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                      );
                      hand1=1;
                    },

                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(

                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/2.jpeg",
                        ),


                      ),
                    ),
                    onPressed: () {
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                      );
                      num2=1;
                      result2();
                      if(c1==5){
                        c1=0;
                        c2=0;
                        AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/mixkit-game-level-completed-2059.wav"),

                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const page2()),
                        );
                      }
                      if(c2==3){
                        c2=0;
                        c1=0;
                        AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const gameover()),
                        );
                      }




                    },

                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.black,
                    ),
                  ),

                ],

              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/f4.jpeg",
                        ),


                      ),
                    ),
                    onPressed: () {
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                      );
                      hand4=1;
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/3.jpeg",
                        ),


                      ),
                    ),
                    onPressed: () {
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/mixkit-arcade-game-jump-coin-216.wav"),

                      );
                      num3=1;
                      result3();
                      if(c1==5){
                        c1=0;
                        c2=0;
                        AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/mixkit-game-level-completed-2059.wav"),

                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const page2()),
                        );
                      }
                      if(c2==3){
                        c1=0;
                        c2=0;
                        AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/mixkit-game-over-dark-orchestra-633.wav"),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const gameover()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      backgroundColor: Colors.black,
                      shape: const CircleBorder(),
                    ),
                  ),

                ],

              ),
            ],
          ),
        ),
      ),
      ),
      ),
    );
    
  }
  
}



