import 'package:flutter/material.dart';
import 'package:partywillingness/analysisclass.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:async';
import 'add_students.dart';
import 'home.dart';
import 'database.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';


final dbHelper = DatabaseHelper();
void main() {
  runApp( splash());
}


class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',

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
  String? _filePath;
  String? _fileName;
  bool isLoad = false;
 void dial(){
   showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(

           title: Text('Success '),
           // To display the title it is optional
           content: Container(
             height: 60,
             child: Column(children: [
               Text('File Uploaded'),

               TextButton(
                 style: ElevatedButton.styleFrom(
                   fixedSize: const Size(40, 40),
                   shape: const CircleBorder(),
                   backgroundColor: Colors.amber,
                 ),
                 // FlatButton widget is used to make a text to work like a button

                 onPressed: () {

                   Navigator.pop(context);

                 },
                 // function used to perform after pressing the button
                 child: Text('Ok'),
               ),
             ] // Message which will be pop up on the screen
               // Action widget which will provide the user to acknowledge the choice


             ),
           ),
         );
       }
   );
   dial();
 }
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    print(result);

    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;
    setState(() {
      _fileName = file.name;
    });
    var bytes = File(file.path ?? "").readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    final row = excel.tables[excel.tables.keys.first]!.rows
        .map((e) => e.map((e) => e!.value).toList())
        .toList();

    row.forEach((e) async {
      int index = row.indexOf(e);
      print(row[index][0]);
      print(row[index][1]);
      print(row[index][2]);
      print(row[index][3]);
      print(row[index][4]);
      print(row[index][5]);
      print(row[index][6]);
      print(row[index][7]);

      Map<String, dynamic> rw = {
        DatabaseHelper.columnName: row[index][1].toString(),
        DatabaseHelper.columnReg: row[index][2].toString(),
        DatabaseHelper.columnEmail: row[index][3].toString(),
        DatabaseHelper.columnGender: row[index][4].toString(),
        DatabaseHelper.columnPhone: row[index][5].toString(),
        DatabaseHelper.columnStatus: row[index][6].toString(),
        DatabaseHelper.columnfee: row[index][7],
      };
      final id = await dbHelper.insert(rw);
      debugPrint('inserted row id: $id');



    });

  }
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
      )),
        backgroundColor: Colors.black,
        ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/f.gif"),
                          fit: BoxFit.cover),
                    ),

                  ),

                  Container(
                    height: 70,
                    width:200,
                    child:
                    ElevatedButton(
                      child: GradientText(
                        'UPLOAD FILE',
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
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        _pickFile();

                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width:200,
                    child:
                    ElevatedButton(
                      child: GradientText(
                        'ADD STUDENT',
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
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddStudents()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width:200,
                    child: ElevatedButton(
                      child: GradientText(
                        'VIEW RECORD',
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
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Home()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width:200,
                    child: ElevatedButton(
                      child: GradientText(
                        'VIEW CHART',
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
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        setState(() {
                          mm1();
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  HomePage2()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
