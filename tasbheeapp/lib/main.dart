import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(splash());
}
class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home:mm(),
    );



  }
}
class mm extends StatefulWidget {
  const mm({Key? key}) : super(key: key);

  @override
  State<mm> createState() => _mmState();
}

class _mmState extends State<mm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black,
              Colors.amber,

              Colors.black,

            ],
          )
      ),
      child:  AnimatedSplashScreen.withScreenFunction(
          duration: 3000,
          splash: 'assets/c.png',
          screenFunction: () async{
            return tasbhee();
          },
          splashTransition: SplashTransition.sizeTransition,
          backgroundColor: Colors.transparent

      ),

    );
  }
}
String? tasbheename;
int ? countervalue;
int num=0;
int limitchecker=10000;
int Counter=0;
String tnmae="Sallallahu Alaihi Wasallam";
var namevalue="Sallallahu Alaihi Wasallam";
var countvalue=0;




List<ElevatedButton> mylist = [];




class tasbhee extends StatefulWidget {
  const tasbhee({Key? key}) : super(key: key);

  @override
  State<tasbhee> createState() => _tasbheeState();
}

class _tasbheeState extends State<tasbhee> {
  final Name = TextEditingController();
  final number = TextEditingController();
  Future<SharedPreferences> JD = SharedPreferences.getInstance();
  late SharedPreferences pref;
  getData()async {
    pref= await JD;
    tasbheename=pref.containsKey("string") ? pref.getString("string"): "";
    countervalue=(pref.containsKey("int") ? pref.getInt("int"): "0") as int?;
    setState(() {
      tnmae=tasbheename!;
      Counter=countervalue!;
    });
  }
  void initState(){
    getData();
    super.initState();
  }

@override


    // TODO: implement initState

  @override

  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    centerTitle: true,
    title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    height: 30,
    width: 30,
    child:Image(
    image: AssetImage("assets/tasbhee-removebg-preview.png"),
    fit: BoxFit.cover),
    ),


    const SizedBox(
    width: 10,
    ),
    const Text(
    'Tasbhee App',
    style: TextStyle(color: Colors.amber),
    ),
    ],
    ),
    backgroundColor: Colors.black87, //<-- SEE HERE

    ),
    body:
    Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 50,
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Custom Tasbhee', style: TextStyle(color: Colors.amber),),
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.black,
                  ),
                    onPressed:() {
                    ///custome tesbhee
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/cc.wav"),
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(

                              title: Text('Custom Tesbhee '),
                              content: Container(
                                height: 200,
                                child: Column(
                                  children: [
                                    Text('Tesbhee Name'),

                                    TextField(

                                      controller:  Name,
                                      decoration: InputDecoration(
                                        hintText: "Allah",
                                        border: OutlineInputBorder(),
                                        suffixIcon: IconButton(
                                            onPressed:(){
                                              //text field
                                              AssetsAudioPlayer.newPlayer().open(
                                                Audio("assets/cc.wav"),
                                              );
                                              Name.clear();
                                            },
                                            icon: const Icon(Icons.clear_rounded)
                                        ),


                                      ),


                                    ),
                                    Text('Tasbhee Count'),
                                    TextField(

                                      controller:  number,
                                      decoration: InputDecoration(
                                        hintText: "max 10000",
                                        border: OutlineInputBorder(),
                                        suffixIcon: IconButton(
                                            onPressed:(){
                                              //limit
                                              AssetsAudioPlayer.newPlayer().open(
                                                Audio("assets/cc.wav"),
                                              );
                                              number.clear();
                                            },
                                            icon: const Icon(Icons.clear_rounded)
                                        ),


                                      ),


                                    ),


                                  ],
                                ),
                              ),

                              actions: [
                                TextButton(

                                  onPressed: () {
                                    //cancel
                                    AssetsAudioPlayer.newPlayer().open(
                                      Audio("assets/cc.wav"),
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Text('CANCEL'),
                                ),
                                TextButton(

                                  onPressed: () {
                                    //add
                                    AssetsAudioPlayer.newPlayer().open(
                                      Audio("assets/cc.wav"),
                                    );

                                    num++;
                                    String varname=Name.text;
                                    int  varnumber=int.parse(number.text);
                                    if( varnumber>10000){
                                      varnumber=10000;
                                    }
                                    mylist.add( ElevatedButton(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        Text("$num :  $varname", style: TextStyle(color: Colors.amber)),
                                        Text(varnumber.toString(), style: TextStyle(color: Colors.amber)),
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(


                                        backgroundColor: Colors.black,
                                      ),
                                      onPressed: () {
                                        //buten list
                                        AssetsAudioPlayer.newPlayer().open(
                                          Audio("assets/cc.wav"),
                                        );
                                        setState(() {

                                          tnmae=varname;
                                          limitchecker=varnumber;
                                          Counter=0;
                                          Get.to(tasbhee());
                                          Navigator.pop(context);
                                        });
                                        Navigator.pop(context);
                                        Get
                                            .to(tasbhee());
                                      },
                                    ));
                                    setState(() {
                                      tnmae=varname;
                                      limitchecker=varnumber;
                                      Counter=0;

                                    });

                                    number.clear();
                                    Name.clear();
                                    Navigator.pop(context);
                                  },
                                  child: Text('ADD Tesbhee'),
                                ),
                              ],
                          );
                        },
                      );

                    }

                ),
                ElevatedButton(
                  child: Text('Saved Tasbhee', style: TextStyle(color: Colors.amber),),
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    // screen 2
                    AssetsAudioPlayer.newPlayer().open(
                      Audio("assets/cc.wav"),
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>tasbhee2()));
                  },
                ),
              ],
            ),
          ),
    SizedBox(
      height: 30,
    ),
    Center(
      child:Padding(
        padding: const EdgeInsets.all(13.0),
        child: Center(
          child: Column(
            children: [
              Text('$tnmae', style: TextStyle(color: Colors.amber,fontSize: 15),),
              SizedBox(height: 20,),
              Text('$Counter', style: TextStyle(color: Colors.amber,fontSize: 30)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/c.png",
                        ),


                      ),
                    ),
                    onPressed: () {

                      // completed
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/cc.wav"),
                      );
                      if(Counter==limitchecker){
                          showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(

                                title: Text('Success '),
                                // To display the title it is optional
                                content: Container(
                                  height: 80,
                                  child: Column(children: [
                                    Text('You completed  $tnmae'),
                                    Text('Limit Reached $limitchecker'),
                                    TextButton(
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(40, 40),
                                        shape: const CircleBorder(),
                                        backgroundColor: Colors.amber,
                                      ),
                                    // FlatButton widget is used to make a text to work like a button

                                      onPressed: () {
                                        AssetsAudioPlayer.newPlayer().open(
                                          Audio("assets/cc.wav"),
                                        );
                                         Navigator.pop(context);

                                      },
                                      // function used to perform after pressing the button
                                      child: Text('Ok'),
                                    ),
                                  ] // Message which will be pop up on the screen
                                    // Action widget which will provide the user to acknowledge the choice


                                  ),
                                ),
                            );
                          }
                        );

                      }else {
                        setState(() {
                          Counter++;
                        });
                        pref.setString("string",tnmae);
                        pref.setInt("int",Counter);
                      }


                      },


                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.amber,
                    ),
                  ),




                  SizedBox(width: 30,),
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/reset.png",
                        ),


                      ),
                    ),
                    onPressed: () {
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/cc.wav"),
                      );
                      setState(() {
                        Counter=0;
                      });
                    },


                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                width: 500,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/kaba.gif"),
                      fit: BoxFit.cover),
                ),

              ),

            ],

          )
        ),
      )
    ),
    
        ],
      ),
    )
    );

  }


}

class tasbhee2 extends StatefulWidget {
  const tasbhee2({Key? key}) : super(key: key);


  @override
  State<tasbhee2> createState() => _tasbhee2State();

}

class _tasbhee2State extends State<tasbhee2> {
  @override
  Future<SharedPreferences> JD = SharedPreferences.getInstance();
  late SharedPreferences pref;
  getData()async {
    pref = await JD;
    tasbheename=pref.containsKey("string") ? pref.getString("string"): "";
    countervalue=(pref.containsKey("int") ? pref.getInt("int"): "0") as int?;
    setState(() {
      tnmae=tasbheename!;
      Counter=countervalue!;       
    });
  }
  void initState(){
    getData();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
        height: 30,
        width: 30,
        child:Image(
        image: AssetImage("assets/tasbhee-removebg-preview.png"),
    fit: BoxFit.cover),
    ),


    const SizedBox(
    width: 10,
    ),
    const Text(
    'Tasbhee App',
    style: TextStyle(color: Colors.amber),
    ),
    ],
    ),
    backgroundColor: Colors.black87, //<-- SEE HERE

    ),
    body: SingleChildScrollView(
      child: Container(

        child:Column(
          children: [
           Container(
             color: Colors.deepPurple.shade50,
             height: 300,
             width: double.infinity,
             child: Column(
               children: [
                 Text("Predefined Option",style: TextStyle(color: Colors.black,fontSize: 30),),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     ElevatedButton(
                       child: CircleAvatar(
                         radius: 130,
                         backgroundColor: Colors.transparent,

                         child: ClipOval(
                           child: Image.asset("assets/Subhanallah.jpg",
                           ),


                         ),
                       ),
                       onPressed: () {
                         AssetsAudioPlayer.newPlayer().open(
                           Audio("assets/cc.wav"),
                         );
                         setState(() {
                           tnmae="Subhan Allah";
                           limitchecker=33;
                           Counter=0;
                           Get.to(tasbhee());
                         });
                         pref.setString("string",tnmae);
                         pref.setInt("int",Counter);
                         Get.to(tasbhee());
                       },


                       style: ElevatedButton.styleFrom(
                         fixedSize: const Size(100, 100),
                         shape: const CircleBorder(),
                         backgroundColor: Colors.amber,
                       ),
                     ),

                     ElevatedButton(
                       child: CircleAvatar(
                         radius: 130,
                         backgroundColor: Colors.transparent,

                         child: ClipOval(
                           child: Image.asset("assets/Alhamdulilah.png",
                           ),


                         ),
                       ),
                       onPressed: () {
                         AssetsAudioPlayer.newPlayer().open(
                           Audio("assets/cc.wav"),
                         );
                         setState(() {
                           tnmae="Alhamdulillah";
                           limitchecker=33;
                           Counter=0;
                           Get.to(tasbhee());
                         });
                         pref.setString("string",tnmae);
                         pref.setInt("int",Counter);
                         Get.to(tasbhee());
                       },


                       style: ElevatedButton.styleFrom(
                         fixedSize: const Size(100, 100),
                         shape: const CircleBorder(),
                         backgroundColor: Colors.amber,
                       ),
                     ),
                     ElevatedButton(
                       child: CircleAvatar(
                         radius: 130,
                         backgroundColor: Colors.transparent,

                         child: ClipOval(
                           child: Image.asset("assets/allahhuakbar.jpg",
                           ),


                         ),
                       ),
                       onPressed: () {
                         AssetsAudioPlayer.newPlayer().open(
                           Audio("assets/cc.wav"),
                         );
                         setState(() {
                           tnmae="Allah hu Aakbar";
                           limitchecker=34;
                           Counter=0;
                           Get.to(tasbhee());
                         });
                         pref.setString("string",tnmae);
                         pref.setInt("int",Counter);
                         Get.to(tasbhee());
                       },


                       style: ElevatedButton.styleFrom(
                         fixedSize: const Size(100, 100),
                         shape: const CircleBorder(),
                         backgroundColor: Colors.amber,
                       ),
                     ),
                   ],
                 ),
                 Row(

                   children: [
                     SizedBox(
                       width: 45,
                     ),
                     Text("33"),
                     SizedBox(
                       width: 105,
                     ),
                     Text("33"),
                     SizedBox(
                       width: 110,
                     ),
                     Text("34"),
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
                           child: Image.asset("assets/Istagfar.jpg",
                           ),


                         ),
                       ),
                       onPressed: () {
                         AssetsAudioPlayer.newPlayer().open(
                           Audio("assets/cc.wav"),
                         );
                         setState(() {
                           tnmae="Astagfirullah";
                           limitchecker=100;
                           Counter=0;

                         });
                         pref.setString("string",tnmae);
                         pref.setInt("int",Counter);
                         Get.to(tasbhee());
                       },


                       style: ElevatedButton.styleFrom(
                         fixedSize: const Size(100, 100),
                         shape: const CircleBorder(),
                         backgroundColor: Colors.amber,
                       ),
                     ),

                     ElevatedButton(
                       child: CircleAvatar(
                         radius: 130,
                         backgroundColor: Colors.transparent,

                         child: ClipOval(
                           child: Image.asset("assets/kalma.png",
                           ),


                         ),
                       ),
                       onPressed: () {
                         AssetsAudioPlayer.newPlayer().open(
                           Audio("assets/cc.wav"),
                         );
                         setState(() {
                           tnmae="la ilaha illallah muhammadur rasulullah";
                           limitchecker=100;
                           Counter=0;

                         });
                         pref.setString("string",tnmae);
                         pref.setInt("int",Counter);
                         Get.to(tasbhee());
                       },


                       style: ElevatedButton.styleFrom(
                         fixedSize: const Size(100, 100),
                         shape: const CircleBorder(),
                         backgroundColor: Colors.amber,
                       ),
                     ),
                     ElevatedButton(
                       child: CircleAvatar(
                         radius: 130,
                         backgroundColor: Colors.transparent,

                         child: ClipOval(
                           child: Image.asset("assets/Allahho.jpg",
                           ),


                         ),
                       ),
                       onPressed: () {
                         AssetsAudioPlayer.newPlayer().open(
                           Audio("assets/cc.wav"),
                         );
                         setState(() {
                           tnmae="Allah Hu";
                           limitchecker=100;
                           Counter=0;


                         });
                         pref.setString("string",tnmae);
                         pref.setInt("int",Counter);

                         Get.to(tasbhee());
                       },


                       style: ElevatedButton.styleFrom(
                         fixedSize: const Size(100, 100),
                         shape: const CircleBorder(),
                         backgroundColor: Colors.amber,
                       ),
                     ),
                   ],
                 ),
                 Row(

                   children: [
                     SizedBox(
                       width: 42,
                     ),
                     Text("100"),
                     SizedBox(
                       width: 105,
                     ),
                     Text("100"),
                     SizedBox(
                       width: 110,
                     ),
                     Text("100"),
                   ],
                 ),
               ],
             ),

           ),
            Text("Custom Tasbhee List",style: TextStyle(color: Colors.black,fontSize: 30)),
            Column(
              children: mylist
            )
          ],

        )
      ),
    )

      );

  }
}

