import 'package:flutter/material.dart';
class inputpage extends StatefulWidget {
  const inputpage({Key? key}) : super(key: key);

  @override
  State<inputpage> createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

          body:  Center(
            child: Text("test"),
          )
      ),

    );

  }
}