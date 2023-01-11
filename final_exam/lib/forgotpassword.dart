import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'signup.dart';
class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
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
              SizedBox(height: 100,),
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

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // Background color
                          onPrimary: Colors.amber,
                          // Text Color (Foreground color)
                        ),
                        child: Text('Forgot', style: TextStyle(fontSize: 24)),
                        // Black foreground color
                        onPressed: () {
                          // Code to execute when the button is pressed
                        },
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
