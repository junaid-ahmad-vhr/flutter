import 's2gamestartes.dart';
import 'package:flutter/material.dart';
import 's4result.dart';
class screen3 extends StatefulWidget {
  const screen3({Key? key}) : super(key: key);

  @override
  State<screen3> createState() => _screen3State();
}

class _screen3State extends State<screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(
          child: Text('Result & Databases',style: TextStyle(color: Colors.amber),
          ),
        ),
          backgroundColor: Colors.black,),
        backgroundColor: Colors.amber,
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                SizedBox(
                  height: 30
                ),

                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // Background color
                        onPrimary: Colors.amber,
                        // Text Color (Foreground color)

                      ),
                      child: Text('$correct Tries  Right out of $trying', style: TextStyle(fontSize: 24)),
                      // Black foreground color
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>screen4()));
                      }

                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
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
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black, // Background color
                                onPrimary: Colors.amber,
                                // Text Color (Foreground color)

                              ),
                              child: Text('Add Data in Firestore', style: TextStyle(fontSize: 24)),
                              // Black foreground color
                              onPressed: (){

                              }

                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black, // Background color
                                onPrimary: Colors.amber,
                                // Text Color (Foreground color)

                              ),
                              child: Text('Add data in SQLite', style: TextStyle(fontSize: 24)),
                              // Black foreground color
                              onPressed: (){

                              }

                          ),
                        ),

                      ],

                    ),
                  ),

                ),

              ],
            ),
          ),
        )
    );
  }
}
