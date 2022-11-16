import 'package:flutter/material.dart';
void main(){
  runApp(tasbhee());
}
class tasbhee extends StatefulWidget {
  const tasbhee({Key? key}) : super(key: key);

  @override
  State<tasbhee> createState() => _tasbheeState();
}

class _tasbheeState extends State<tasbhee> {
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
    )
    )
    );
  }
}



