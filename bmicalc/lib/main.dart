import 'package:flutter/material.dart';


void main() {
  runApp(bmicalc());
}

class bmicalc extends StatelessWidget {
  const bmicalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: inputpage(),
      theme: ThemeData.dark(),
    );
  }
}
class inputpage extends StatefulWidget {
  const inputpage({Key? key}) : super(key: key);

  @override
  State<inputpage> createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("test"),
    );
  }
}

