import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/sqliteresult.dart';
import 'show_all_record.dart';
class optionresult extends StatefulWidget {
  const optionresult({Key? key}) : super(key: key);

  @override
  State<optionresult> createState() => _optionresultState();
}

class _optionresultState extends State<optionresult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Result Options"),
        ),
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 200,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black, // Background color
                              onPrimary: Colors.amber,
                              // Text Color (Foreground color)
                            ),
                            onPressed:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowAllRecord()));

                        }, child:Text("View Firebase Record",style: TextStyle(fontSize: 25),)),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // Background color
                            onPrimary: Colors.amber,
                            // Text Color (Foreground color)
                          ),
                          onPressed:(){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => sql()));

                          }, child:Text("     View Sql Record     ",style: TextStyle(fontSize: 25),)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
