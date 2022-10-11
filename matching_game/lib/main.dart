import 'package:flutter/material.dart';

void main() {
  runApp(const matchinggame());
}
class matchinggame extends StatefulWidget {
  const matchinggame({Key? key}) : super(key: key);

  @override
  State<matchinggame> createState() => _matchinggameState();
}

class _matchinggameState extends State<matchinggame> {
  @override
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
    body:Container(
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
    ),
        ),
    );
  }
}
