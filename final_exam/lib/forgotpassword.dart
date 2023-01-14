import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';
class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  String email = "";
  final _formKey  = GlobalKey<FormState>();
  TextEditingController _email = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(' Forgot password',style: TextStyle(color: Colors.amber),)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.amber,
      body:SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("GUESS GAME",style: TextStyle(color: Colors.black,fontSize: 40),),
              SizedBox(height: 20,),
              SizedBox(height: 100,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),

                height: 250,
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
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(15.0),
                              labelText: 'Email'
                          ),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller:_email,


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

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // Background color
                            onPrimary: Colors.amber,
                            // Text Color (Foreground color)
                          ),
                          child: Text('Forgot', style: TextStyle(fontSize: 24)),
                          // Black foreground color
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              FirebaseAuth.instance.sendPasswordResetEmail(
                                  email: _email.text).then((value) =>
                                  Navigator.of(context).pop());
                              // Code to execute when the button is pressed
                            }
                          },
                        ),




                      ],

                    ),
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
