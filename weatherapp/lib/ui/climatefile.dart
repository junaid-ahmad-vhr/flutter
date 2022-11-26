import 'package:flutter/material.dart';
class Climate extends StatefulWidget {
  const Climate({Key? key}) : super(key: key);

  @override
  State<Climate> createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Climate App'),
      backgroundColor: Colors.red,
      actions: [
        IconButton(onPressed: (){
          print('clicked');
        }, icon: Icon(Icons.menu))
        ],),
      body: Stack(
         children: [
           Center(
             child: Image(
               image: AssetImage('assets/um.jpg'),
               height: 1200.0,
               width: 600.0,
               fit: BoxFit.fill,
             ),
           ),
           Container(
             alignment: Alignment.topRight,
             margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0) ,
             child: Text(
               'vehari',style: citystyle(),
             ),
           )
         ],
      ),



    );
  }
}
TextStyle citystyle(){
  return TextStyle(
    color:  Colors.white,
    fontSize: 22.0,
    fontStyle: FontStyle.italic
  );

}