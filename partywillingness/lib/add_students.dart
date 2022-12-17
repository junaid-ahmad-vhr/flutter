import 'package:flutter/material.dart';
import 'home.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'database.dart';

final dbHelper = DatabaseHelper();

class AddStudents extends StatefulWidget {
  const AddStudents({Key? key}) : super(key: key);

  @override
  _AddStudentsState createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  TextEditingController regCon = new TextEditingController();
  TextEditingController nameCon = new TextEditingController();
  TextEditingController emailCon = new TextEditingController();
  TextEditingController addressCon = new TextEditingController();
  TextEditingController phoneCon = new TextEditingController();
  TextEditingController feecon = new TextEditingController();

  bool isloading = false;
  int a = 1;

  bool check = false;
  bool ? _isMale = false;
  bool _isFemale = false;
  bool _ispaid = false;
  bool _isunpaid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar (title: Center(child:GradientText(
        'Add Student Record',
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
      body: isloading
          ? CircularProgressIndicator()
          : Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  TextField(
                    controller: nameCon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Text(
                        "Enter Name",
                        style: TextStyle(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: "Junaid",
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: regCon,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter Registration ",
                        style: TextStyle(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: "Batch-Cource-Roll",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  TextField(
                    controller: phoneCon,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter Phone Number",
                        style: TextStyle(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: "03xxxxxxxxx",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  TextField(
                    controller: emailCon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Text(
                        "Enter Email",
                        style: TextStyle(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: "junaid@gmail.com",
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: feecon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Text(
                        "Enter Fee",
                        style: TextStyle(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: "example@gmail.com",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Gender:')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _isMale,
                        onChanged: (value) {
                          setState(() {
                            _isMale = value!;

                             _isFemale = false;
                          });
                        },
                      ),
                      Text('Male'),
                      Checkbox(
                        value: _isFemale,
                        onChanged: (value) {
                          setState(() {
                            _isFemale = value!;



                             _isMale = false;
                          });
                        },
                      ),
                      Text('Female'),

                    ],
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Status:')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _ispaid,
                        onChanged: (value) {
                          setState(() {
                            _ispaid = value!;

                             _isunpaid = false;
                          });
                        },
                      ),
                      Text('Paid'),
                      Checkbox(
                        value: _isunpaid,
                        onChanged: (value) {
                          setState(() {
                            _isunpaid = value!;


                             _ispaid = false;
                          });
                        },
                      ),
                      Text('unpaid'),

                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          Map<String, dynamic> row = {
                            DatabaseHelper.columnName: nameCon.text,
                            DatabaseHelper.columnReg: regCon.text,
                            DatabaseHelper.columnEmail: emailCon.text,
                            DatabaseHelper.columnfee: feecon.text,
                            DatabaseHelper.columnGender:
                                _isMale == false ? "Female" : "Male",
                            DatabaseHelper.columnStatus:
                            _isMale == false ? "Unpaid" : "Paid",
                            DatabaseHelper.columnPhone: phoneCon.text,

                          };
                          final id = await dbHelper.insert(row);
                          debugPrint('inserted row id: $id');
                        },
                        child: GradientText(
                          'SUBMIT DETAIL',
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
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.all(15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
