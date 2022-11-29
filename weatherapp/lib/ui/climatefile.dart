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
  String ? _cityEntered;

  var _cityFieldController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Widget updateTempWidget(String city) {
      return FutureBuilder(
          future: getWeather(util.apiId, city == null ? util.defaultCity : city),
          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
            //where we get all of the json data, we setup widgets etc.
            if (snapshot.hasData) {
              Map ? content = snapshot.data;
              return Container(
                margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new ListTile(
                      title: new Text(
                        content!['main']['temp'].toString() + " F",
                        style: new TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 49.9,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: new ListTile(
                        title: new Text(
                          "Humidity: ${content['main']['humidity'].toString()}\n"
                              "Min: ${content['main']['temp_min'].toString()} F\n"
                              "Max: ${content['main']['temp_max'].toString()} F ",
                          style: extraData(),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          });
    }

    return Scaffold(
      appBar: AppBar(title: Text('Climate App'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/sst.jpg'),
              height: 1200.0,
              width: 600.0,
              fit: BoxFit.fill,
            ),
          ),

          ListView(
            children: [
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter City',
                  ),
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor : Colors.white,
                      backgroundColor: Colors.purpleAccent,

                    ),
                    onPressed: () {

                      setState(() {
                        _cityEntered= _cityFieldController.text;
                      });


                    },



                    child: Text('Get Weather')),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child:  Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0) ,
              child: Text(
                '${_cityEntered == null ? util.defaultCity : _cityEntered}',
                style: citystyle(),
              ),
            ),
          ),
          Center(
            child: Image(
              image: AssetImage('assets/rain.png'),
              height: 100.0,
              width: 100.0,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30.0, 90.0, 0.0, 0.0),
            child: updateTempWidget(
                '${_cityEntered == null ? util.defaultCity : _cityEntered}'),
          ),
        ],
      ),



    );
  }
  Future<Map> getWeather(String appId, String city) async {
    String ? apiUrl='http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${util.apiId}&units=imperial';
    http.Response ?  response = await http.get(Uri.parse(apiUrl));

    return json.decode(response.body);
  }
}
class ChangeCity extends StatefulWidget {
  @override
  State<ChangeCity> createState() => _ChangeCityState();
}

class _ChangeCityState extends State<ChangeCity> {
  var _cityFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('Change City'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/snow.png',
              width: 590.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),
          ListView(
            children: [
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter City',
                  ),
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor : Colors.white,
                      backgroundColor: Colors.red,

                    ),
                    onPressed: () {



                      Navigator.pop(
                          context,
                          {'enter': _cityFieldController.text});


                    },



                    child: Text('Get Weather')),
              )
            ],
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
TextStyle tempStyle() {
  return TextStyle(
      color: Colors.white,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 49.9);
}

TextStyle extraData() {
  return TextStyle(
      color: Colors.white70, fontStyle: FontStyle.normal, fontSize: 17.0);
}