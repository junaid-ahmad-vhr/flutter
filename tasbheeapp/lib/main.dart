import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
int num=0;
int limitchecker=0;
int Counter=0;
String tnmae="Sallallahu Alaihi Wasallam";

String ? v;


List<ElevatedButton> mylist = [];
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: tasbhee() //create new class for 'home' property of MaterialApp()

    );
  }
}

class tasbhee extends StatefulWidget {
  const tasbhee({Key? key}) : super(key: key);

  @override
  State<tasbhee> createState() => _tasbheeState();
}

class _tasbheeState extends State<tasbhee> {
  final Name = TextEditingController();
  final number = TextEditingController();

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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Expanded(
                            child: AlertDialog(

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
                                              number.clear();
                                            },
                                            icon: const Icon(Icons.clear_rounded)
                                        ),


                                      ),


                                    ),
                                    Text('$v')

                                  ],
                                ),
                              ),

                              actions: [
                                TextButton(

                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('CANCEL'),
                                ),
                                TextButton(

                                  onPressed: () {

                                    num++;
                                    String varname=Name.text;
                                    int  varnumber=int.parse(number.text);
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
                                        setState(() {
                                          tnmae=varname;
                                          limitchecker=varnumber;
                                          Counter=0;
                                        });
                                        Navigator.pop(context);
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
                            ),
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
                      if(Counter==limitchecker){
                          showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: AlertDialog(

                                title: Text('Success '),
                                // To display the title it is optional
                                content: Container(
                                  height: 100,
                                  child: Column(children: [
                                    Text('You completed  $tnmae'),
                                    Text('Limit Reached $limitchecker'),
                                    TextButton( // FlatButton widget is used to make a text to work like a button

                                      onPressed: () {
                                         Navigator.pop(context);

                                      },
                                      // function used to perform after pressing the button
                                      child: Text('Ok'),
                                    ),
                                  ] // Message which will be pop up on the screen
                                    // Action widget which will provide the user to acknowledge the choice


                                  ),
                                ),
                              ),
                            );
                          }
                        );

                      }else {
                        setState(() {
                          Counter++;
                        });
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
                         setState(() {
                           tnmae="Subhan Allah";
                           limitchecker=33;
                           Counter=0;
                           Navigator.pop(context);
                         });

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
                         setState(() {
                           tnmae="Alhamdulillah";
                           limitchecker=33;
                           Counter=0;
                           Navigator.pop(context);
                         });

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
                         setState(() {
                           tnmae="Allah hu Aakbar";
                           limitchecker=34;
                           Counter=0;
                           Navigator.pop(context);

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
                         setState(() {
                           tnmae="Istagfirullah";
                           limitchecker=100;
                           Counter=0;
                           Navigator.pop(context);
                         });

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
                         setState(() {
                           tnmae="la ilaha illallah muhammadur rasulullah";
                           limitchecker=100;
                           Counter=0;
                           Navigator.pop(context);
                         });

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
                         setState(() {
                           tnmae="Allah Hu";
                           limitchecker=100;
                           Counter=0;


                         });
                         Navigator.pop(context);
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

