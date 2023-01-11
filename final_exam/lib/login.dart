import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'signup.dart';
import 'forgotpassword.dart';
import 's1startgame.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('LOGIN PAGE',style: TextStyle(color: Colors.amber),)),
      backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.amber,
      body:SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 100,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),

                height: 400,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(15.0),
                          labelText: 'Email'
                        ),
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
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(15.0),
                            labelText: 'Password'
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
                            return 'password must contain at least one letter, one number and must be 8 characters long.';
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text('Forgot Password'),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotpassword()));
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
                        onPressed: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) =>  screen1()));
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                                // Code to execute when the button is pressed
                              },
                            ),
                          ],
                        ),



                    ],

                  ),
                ),




              ),
            ],
          ),
        ),
      )
      ,
    );
  }
}
