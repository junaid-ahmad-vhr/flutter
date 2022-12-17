import 'package:flutter/material.dart';
import 'package:partywillingness/analysisclass.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:async';
import 'add_students.dart';
import 'home.dart';
import 'database.dart';
import 'analysisclass.dart';
final dbHelper = DatabaseHelper();
void main() {
  runApp( splash());
}


class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',

      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const homescreen ())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/ssl.gif"),
            fit: BoxFit.cover),
      ),
    );

  }
}
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (title: Center(child:GradientText(
        'Party Willingness',
        style: TextStyle(
          fontSize: 25.0,
        ),
        colors: [
          Colors.red,
          Colors.pinkAccent,
          Colors.teal,
          Colors.green,
          Colors.purple,

          //add mroe colors here.
        ],
      )),
        backgroundColor: Colors.black,
        ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/f.gif"),
                          fit: BoxFit.cover),
                    ),

                  ),
                  Container(
                    height: 100,
                    width:200,
                    child:
                    ElevatedButton(
                      child: GradientText(
                        'ADD STUDENT',
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                        colors: [
                          Colors.red,
                          Colors.pinkAccent,
                          Colors.teal,
                          Colors.green,
                          Colors.purple,

                          //add mroe colors here.
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddStudents()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 100,
                    width:200,
                    child: ElevatedButton(
                      child: GradientText(
                        'VIEW RECORD',
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                        colors: [
                          Colors.red,
                          Colors.pinkAccent,
                          Colors.teal,
                          Colors.green,
                          Colors.purple,

                          //add mroe colors here.
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Home()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width:200,
                    child: ElevatedButton(
                      child: GradientText(
                        'VIEW CHART',
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                        colors: [
                          Colors.red,
                          Colors.pinkAccent,
                          Colors.teal,
                          Colors.green,
                          Colors.purple,

                          //add mroe colors here.
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        setState(() {
                          mm1();
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  HomePage2()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
