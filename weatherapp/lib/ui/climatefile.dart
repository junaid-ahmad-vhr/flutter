import 'package:flutter/material.dart';
import '../utills/apifile.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class Climate extends StatefulWidget {
  const Climate({Key? key}) : super(key: key);

  @override
  State<Climate> createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  void showStuff() async {
    Map data = await getWeather(util.apiId, util.defaultCity);
    print(data.toString());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Climate App'),
      backgroundColor: Colors.red,
      actions: [
        IconButton(onPressed: (){
          showStuff();
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
  Future<Map> getWeather (String appId,String city)async{
    String  apiUrl='http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${util.apiId}&units=imperial';
    http.Response  response = await http.get(Uri.parse(apiUrl));

    return json.decode(response.body);
  }
}
TextStyle citystyle(){
  return TextStyle(
    color:  Colors.white,
    fontSize: 22.0,
    fontStyle: FontStyle.italic
  );

}