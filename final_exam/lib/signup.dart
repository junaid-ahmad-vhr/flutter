import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/login.dart';
import 'package:untitled/s1startgame.dart';


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'SIGNUP PAGE',
          style: TextStyle(color: Colors.amber),
        )),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("GUESS GAME",style: TextStyle(color: Colors.black,fontSize: 40),),
              SizedBox(height: 20,),

              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 550,
                child: Form(

                key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: _username,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(15.0),
                              labelText: 'Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter an Name';
                            }

                            return null;
                          },
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.email_outlined),
                              contentPadding: EdgeInsets.all(15.0),
                              labelText: 'Email'),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter an email';
                            }
                            if (!EmailValidator.validate(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _password,
                          obscureText: true,

                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(15.0),
                              labelText: 'Password'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // Background color
                            onPrimary: Colors.amber,
                            // Text Color (Foreground color)
                          ),
                          child: Text('SIGNUP', style: TextStyle(fontSize: 24)),
                          // Black foreground color
                          onPressed: () async {

                          if (_formKey.currentState!.validate()) {
                            // if (_email.text.isEmpty) {
                            //   var _ModelUser = ModelUser();
                            //   _ModelUser.email = _email.text.trim();
                            //   _ModelUser.pass = _password.text;
                            //   _ModelUser.username = _username.text;
                            //
                            //   var result =
                            //       await _userService.SaveUserAccount(_ModelUser);
                            //   if (result != null) {
                            //     _email.clear();
                            //     _username.clear();
                            //     _password.clear();
                            //
                            //     const snackBar = SnackBar(
                            //       content: Text('Account Create Successfully'),
                            //     );
                            //     ScaffoldMessenger.of(context)
                            //         .showSnackBar(snackBar);
                            //     Navigator.pushReplacement(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => screen1()));
                            //   } else {
                            //     const snackBar = SnackBar(
                            //       content: Text('Somthing went wrong'),
                            //     );
                            //     ScaffoldMessenger.of(context)
                            //         .showSnackBar(snackBar);
                            //   }
                            // } else {
                            //   showDialog(
                            //       context: context,
                            //       builder: (BuildContext context) {
                            //         return AlertDialog(
                            //           title: Center(
                            //               child: Text(
                            //             'Error',
                            //             style: TextStyle(color: Colors.red),
                            //           )),
                            //           content: Text(
                            //               "Account already created. Please reinstall the app then create account."),
                            //           shape: RoundedRectangleBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(20)),
                            //           elevation: 12,
                            //           actions: [
                            //             Center(
                            //               child: TextButton(
                            //                 onPressed: () {
                            //                   Navigator.of(context).pop();
                            //                 },
                            //                 child: Text(
                            //                   'OK',
                            //                   style:
                            //                       TextStyle(color: Colors.white),
                            //                 ),
                            //               ),
                            //             ),
                            //           ],
                            //         );
                            //       });
                            // }
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                email: _email.text,
                                password: _password.text,
                              );
                              FirebaseFirestore.instance
                                  .collection('guess')
                                  .doc(userCredential.user?.uid)
                                  .collection('profile')
                                  .doc()
                                  .set({
                                "username": _username.text,
                                'email': _email.text.trim(),
                              });
                              if (userCredential != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => screen1()),
                                );
                              }
                              //Get.to(HomeScreen());
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    e.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else if (e.code == 'email-already-in-use') {
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    e.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }
                          }
                            // Code to execute when the button is pressed
                          },
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 70,
                            ),
                            Text('If you Already have account '),
                            TextButton(
                              child: Text('LOGIN'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => login()));
                                // Code to execute when the button is pressed
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
