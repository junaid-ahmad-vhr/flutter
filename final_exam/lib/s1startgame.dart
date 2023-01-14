import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 's2gamestartes.dart';
import 'show_all_record.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'resultsoption.dart';
class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {

  Future _showDialog() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("LogOut"),
            content: Text("Are you sure to log out?"),
            actions: [
              MaterialButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    SystemNavigator.pop();

                  },
                  child: Text("Yes")),
              MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Row(
        children: [

          Text('Guess Game',style: TextStyle(color: Colors.amber),),
          Spacer(),
          TextButton(
            child: Icon(Icons.logout,color: Colors.amber,),
            onPressed: () {
             _showDialog();
            },
          ),
        ],
      )),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.amber,
      body:SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [

              
              Align(
                alignment: Alignment.center,

                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  height: 200,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // Background color
                            onPrimary: Colors.amber,
                            // Text Color (Foreground color)
                          ),
                          child: Text('  Start Game  ', style: TextStyle(fontSize: 24)),
                          // Black foreground color
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => gamestated()));
                            // Code to execute when the button is pressed
                          },
                        ),




                      ],

                    ),
                  ),




                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  height: 200,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // Background color
                            onPrimary: Colors.amber,
                            // Text Color (Foreground color)
                          ),
                          child: Text('Show Results', style: TextStyle(fontSize: 24)),
                          // Black foreground color
                          onPressed: () {
                            Get.to(optionresult());
                            // Code to execute when the button is pressed
                          },
                        ),





                      ],

                    ),
                  ),




                ),
              ),
              Container(
                width: 500,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/s2.gif"),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      )
      ,
    );
  }
}
