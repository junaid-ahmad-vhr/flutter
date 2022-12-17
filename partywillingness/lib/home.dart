import 'package:flutter/material.dart';
import 'add_students.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'database.dart';
import 'package:pie_chart/pie_chart.dart';

final dbHelper = DatabaseHelper();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (title: Center(child:GradientText(
        'View Student Record',
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
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: dbHelper.mydb().then((db) => dbHelper.queryAllRows()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Map<String, dynamic>>? rows = snapshot.data;
              return ListView.builder(
                itemCount: rows?.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> list = rows![index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Column(
                              children: [
                                Row(

                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    TextButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,


                                        ),
                                        onPressed: () async {
                                          TextEditingController regno =
                                          TextEditingController(
                                              text: list['reg']);
                                          TextEditingController  status =
                                          TextEditingController(
                                              text: list['status']);
                                          TextEditingController gender =
                                          TextEditingController(
                                              text: list['gender']);
                                          TextEditingController fee =
                                          TextEditingController(
                                              text: list['fee']);
                                          TextEditingController name =
                                          TextEditingController(
                                              text: list['name']);

                                          TextEditingController email =
                                          TextEditingController(
                                              text: list['email']);
                                          TextEditingController phone =
                                          TextEditingController(
                                              text: list['phone']);
                                          await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SingleChildScrollView(
                                                child: AlertDialog(
                                                  title: Center(
                                                      child: Text('Update Record')),
                                                  content: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      TextField(
                                                        controller: name,
                                                        decoration: InputDecoration(
                                                            prefixText: "Name: "),
                                                      ),
                                                      TextField(
                                                        controller: regno,
                                                        decoration: InputDecoration(
                                                            prefixText: "RegNo: "),
                                                      ),

                                                      TextField(
                                                        controller: email,
                                                        decoration: InputDecoration(
                                                            prefixText: "Email: "),
                                                      ),
                                                      TextField(
                                                        controller: phone,
                                                        decoration: InputDecoration(
                                                            prefixText:
                                                            "Phone Number : "),
                                                      ),
                                                      TextField(
                                                        controller: gender,
                                                        decoration: InputDecoration(
                                                            prefixText:
                                                            "Gender : "),
                                                      ),
                                                      TextField(
                                                        controller: status,
                                                        decoration: InputDecoration(
                                                            prefixText:
                                                            "Enter Fee Status : "),
                                                      ),
                                                      TextField(
                                                        controller: fee,
                                                        decoration: InputDecoration(
                                                            prefixText:
                                                            "Fee Ammount : "),
                                                      ),
                                                    ],
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.white,


                                                      ),

                                                      onPressed: () async {
                                                        if (regno.text.isNotEmpty &&
                                                            name.text.isNotEmpty &&
                                                            email.text.isNotEmpty &&
                                                            phone.text.isNotEmpty
                                                            &&
                                                            fee.text.isNotEmpty
                                                            &&
                                                            status.text.isNotEmpty
                                                        &&
                                                            gender.text.isNotEmpty)

                                                        {
                                                          Map<String, dynamic> row = {
                                                            DatabaseHelper.columnId:
                                                            list['_id'],
                                                            DatabaseHelper.columnName:
                                                            name.text,
                                                            DatabaseHelper.columnReg:
                                                            regno.text,
                                                            DatabaseHelper.columnEmail:
                                                            email.text,
                                                            DatabaseHelper.columnGender:
                                                            gender.text,
                                                            DatabaseHelper.columnPhone:
                                                            phone.text,
                                                            DatabaseHelper.columnStatus:
                                                            status.text,
                                                            DatabaseHelper.columnfee:
                                                            fee.text,
                                                          };
                                                          final rowsAffected =
                                                          await dbHelper
                                                              .update(row);
                                                          setState(() {
                                                            Home();
                                                          });
                                                          Navigator.of(context).pop();
                                                        }
                                                      },
                                                      child: Text(
                                                        'Conform',
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child:GradientText(
                                          'Update',
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
                                        )
                                    ),
                                    Spacer(),
                                    TextButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,

                                        ),
                                        onPressed: () async {
                                          Map<String, dynamic> row = {
                                            DatabaseHelper.columnId:
                                            list['_id'],

                                          };
                                          final rowsAffected =
                                          await dbHelper
                                              .Delete(row);
                                          setState(() {
                                            Home();
                                          });
                                        }  ,

                                        child:GradientText(
                                          'Delete',
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
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Student Name",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Spacer(),
                                      Text(
                                        list['name'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Registration Number",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Spacer(),
                                      Text(
                                        list['reg'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Phone number",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Spacer(),
                                      Text(
                                        list['phone'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Email",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Spacer(),
                                      Text(
                                        list['email'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Gender",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Spacer(),
                                      Text(
                                        list['gender'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Fee Status",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Spacer(),
                                      Text(
                                        list['status'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Ammount",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Spacer(),
                                      Text(
                                        list['fee'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                  // return ListTile(
                  //   title: Text(list['phone']),
                  //   subtitle: Text(list['reg'].toString()),
                  // );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),

    );
  }
}

