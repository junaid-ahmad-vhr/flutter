import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 's2gamestartes.dart';
import 's1startgame.dart';

class screen4 extends StatefulWidget {
  const screen4({Key? key}) : super(key: key);

  @override
  State<screen4> createState() => _screen4State();
}

class _screen4State extends State<screen4> {
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
              onPressed: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Logout"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Results',
            style: TextStyle(color: Colors.amber),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: result.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      result[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Text("You Want improvement Click "),
          Text(" below button and restart the Score"),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Background color
                  onPrimary: Colors.amber,
                  // Text Color (Foreground color)
                ),
                child: Text('For Improvement', style: TextStyle(fontSize: 24)),
                // Black foreground color
                onPressed: () {
                  setState(() {
                    result.clear();
                    num1 = 0;
                    num2 = 0;
                    num3 = 0;
                    num4 = 0;
                    var1 = 0;
                    var2 = 0;
                    var3 = 0;
                    var4 = 0;
                    num5 = 0;
                    chance = 2;
                    trying = 0;
                    correct = 0;
                    check = false;
                  });
                  Get.offAll(screen1());
                }),
          ),
        ],
      ),
    );
  }
}
