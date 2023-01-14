import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class ShowAllRecord extends StatefulWidget {
  const ShowAllRecord({Key? key}) : super(key: key);

  @override
  State<ShowAllRecord> createState() => _ShowAllRecordState();
}

class _ShowAllRecordState extends State<ShowAllRecord> {
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
  List<dynamic> showlist = [];
  List<dynamic> title = [];
  getdata() async {
    await FirebaseFirestore.instance
        .collection("guess")
        .doc(current?.uid)
        .collection('result')
        .get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++)
        setState(() {
          showlist.add(value.docs[i].get('show'));
          title.add(value.docs[i].get('title'));
        });
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
    print(showlist);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow.shade600,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Show Record"),
        ),
        body: ListView.builder(
          itemCount: showlist.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: ExpansionTile(
                  iconColor: Colors.white,
                  collapsedTextColor: Colors.black,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    title[index].toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  children: <Widget>[
                    for (int i = 0; i < showlist[index].length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          showlist[index][i].toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
