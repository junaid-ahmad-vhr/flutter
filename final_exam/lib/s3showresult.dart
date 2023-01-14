import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/show_all_record.dart';
import 'login.dart';

import 's2gamestartes.dart';
import 's4result.dart';

import 'database.dart';
var uid = FirebaseAuth.instance.currentUser?.uid;
final dbHelper = DatabaseHelper();
class screen3 extends StatefulWidget {
  const screen3({Key? key}) : super(key: key);

  @override
  State<screen3> createState() => _screen3State();
}

class _screen3State extends State<screen3> {
  void database() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Firebase "),
          content: Row(
            children: [
              Text("Data Save Sucessfully"),
            ],
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void database2() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("SQLITE "),
          content: Row(
            children: [
              Text("Data Save Sucessfully"),
            ],
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void logout(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Logout"),
              onPressed: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => login()));
              },
            ),
          ],
        );
      },
    );

  }
  @override
  User? current = FirebaseAuth.instance.currentUser;
  bool a = false;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Result & Databases',
              style: TextStyle(color: Colors.amber),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.amber,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // Background color
                        onPrimary: Colors.amber,
                        // Text Color (Foreground color)
                      ),
                      child: Text('$correct Tries  Right out of $trying',
                          style: TextStyle(fontSize: 24)),
                      // Black foreground color
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => screen4()));
                      }),
                ),
                SizedBox(
                  height: 100,
                ),

                    Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 200,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black, // Background color
                                      onPrimary: Colors.amber,
                                      // Text Color (Foreground color)
                                    ),
                                    child: Text('Add Data in Firestore',
                                        style: TextStyle(fontSize: 24)),
                                    // Black foreground color
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection("guess")
                                          .doc(current?.uid)
                                          .collection('result')
                                          .add({
                                        "show": result,
                                        "title":
                                            '$correct Tries  Right out of $trying',
                                      });
                                      database();
                                    }),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black, // Background color
                                      onPrimary: Colors.amber,
                                      // Text Color (Foreground color)
                                    ),
                                    child: Text('Add data in SQLite',
                                        style: TextStyle(fontSize: 24)),
                                    // Black foreground color
                                    onPressed: () async{
                                      Map<String, dynamic> row = {
                                        DatabaseHelper.columnUid: uid,
                                        DatabaseHelper.columnCorrect: correct,
                                        DatabaseHelper.columnTotal: trying,
                                      };
                                      final id = await dbHelper.insert(row);
                                      debugPrint('inserted row id: $id');
                                      database2();
                                    }),
                              ),
                            ],
                          ),
                        ),
                      )

              ],
            ),
          ),
        ));
  }
}
