import 'package:flutter/material.dart';
import 's2gamestartes.dart';
class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Guess Game',style: TextStyle(color: Colors.amber),)),
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
                            Navigator.pushReplacement(
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
