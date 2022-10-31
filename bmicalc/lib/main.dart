import 'package:flutter/material.dart';
import 'input_page.dart';


void main() {
  runApp(bmicalc());
}

class bmicalc extends StatelessWidget {
  const bmicalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: inputpage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.cyan,

      )
    );
  }
}


