import 'package:alumni/resources/firebaseRepos.dart';
import 'package:alumni/screens/homeScreen.dart';
import 'package:alumni/screens/loginRelatedScreens/loginScreen.dart';
import 'package:alumni/screens/loginRelatedScreens/signUpScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(splash());
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
            context, MaterialPageRoute(builder: (context) =>  MyApp())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/aa.gif"),
            fit: BoxFit.cover),
      ),
    );

  }
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseRepos _repositories = new FirebaseRepos();
  List<QueryDocumentSnapshot> _list = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
      // home: OtpScreen(_list),

        home:  _repositories.getCurrentUser() != null &&_repositories.getCurrentUser().emailVerified? HomeScreen(_list):LogIn() ,
      routes: {
        'signIn': (context) => LogIn(),
        'signUp': (context) => SignUp(),

      },
    );
  }
}
