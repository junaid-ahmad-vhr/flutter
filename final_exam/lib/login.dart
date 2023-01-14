import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'forgotpassword.dart';
import 's1startgame.dart';
import 'signup.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void dispose() {
    // Perform cleanup tasks here
    super.dispose();
  }
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey  = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'LOGIN PAGE',
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
                height: 480,
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
                          controller: _email,
                          decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email_outlined),
                              hintStyle: TextStyle(
                                  color: Colors.black, fontSize: 16),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(15.0),
                              labelText: 'Email'),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (!EmailValidator.validate(_email.text)) {
                              return 'Please enter a vaild email';
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text('Forgot Password'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => forgotpassword()));
                              // Code to execute when the button is pressed
                            },
                          ),
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
                          child: Text('Login', style: TextStyle(fontSize: 24)),
                          // Black foreground color
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // form is valid

                              // if (_email.text.isNotEmpty &&
                              //     _password.text.isNotEmpty) {
                              //   var _ModelUser = ModelUser();
                              //   _ModelUser.email = _email.text.trim();
                              //   _ModelUser.pass = _password.text;
                              //
                              //   if (_ModelUser != null) {
                              //     _email.clear();
                              //     _password.clear();
                              //     Navigator.pushReplacement(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => screen1()));
                              //   } else {
                              //     const snackBar = SnackBar(
                              //       content: Text('Invalid Username & Password'),
                              //     );
                              //     ScaffoldMessenger.of(context)
                              //         .showSnackBar(snackBar);
                              //   }
                              // } else {
                              //   const snackBar = SnackBar(
                              //     content: Text('Invalid Email & Password'),
                              //   );
                              //   ScaffoldMessenger.of(context)
                              //       .showSnackBar(snackBar);
                              // }
                              try {
                                UserCredential userCredential = await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                  email: _email.text,
                                  password: _password.text,
                                );
                                if (userCredential != null) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => screen1()),
                                  );
                                }
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      e.toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else if (e.code == 'wrong-password') {
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
                            Text('If you donot have account '),
                            TextButton(
                              child: Text('Sign up'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signup()));
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
