import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:async';
void main() {
  runApp( splash());
}


class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
          primarySwatch: Colors.amber
      ),
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
      ))),
      body: Column(
        children: [
          Container(

          )
        ],
      ),
    );
  }
}
