import 'dart:math';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:untitled/s3showresult.dart';

int num1 = 0;
int num2 = 0;
int num3 = 0;
int num4 = 0;
int var1 = 0;
int var2 = 0;
int var3 = 0;
int var4 = 0;
int num5 = 0;
int chance = 2;
int trying = 0;
int correct = 0;
bool check = false;
List<String> result = [];

class gamestated extends StatefulWidget {
  const gamestated({Key? key}) : super(key: key);

  @override
  State<gamestated> createState() => _gamestatedState();
}

class _gamestatedState extends State<gamestated> {
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

              },
            ),
          ],
        );
      },
    );

  }
  void correctdialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("GOOD"),
          content: Text(" Right Answer "),
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

  void chanceoverdialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("OH NO!! Chance over"),
          content: Row(
            children: [
              Text("Genrate rendom number again"),
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

  void checking() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Row(
            children: [
              Text("PLESE Genrate Random number first"),
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

  void wrongdialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("OH no!"),
          content: Text(" Wrong Guess "),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Game Started',
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
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Background color
                    onPrimary: Colors.amber,
                    // Text Color (Foreground color)
                  ),
                  child: Text('Genrate Random Number',
                      style: TextStyle(fontSize: 24)),
                  // Black foreground color
                  onPressed: () {
                    Random random = new Random();
                    num1 = random.nextInt(100) + 100;
                    print(num1);
                    Random random2 = new Random();
                    num2 = random2.nextInt(100) + 100;
                    print(num2);
                    Random random3 = new Random();
                    num3 = random3.nextInt(100) + 100;
                    print(num3);
                    Random random4 = new Random();
                    num4 = random4.nextInt(100) + 100;
                    print(num4);
                    Random random5 = new Random();
                    num5 = random5.nextInt(4) + 1;
                    print(num4);
                    setState(() {
                      chance = 2;
                    });
                    check = true;

                    if (num5 == 1) {
                      setState(() {
                        var1 = num2;
                        var2 = num4;
                        var3 = num1;
                        var4 = num3;
                      });
                    }
                    if (num5 == 2) {
                      setState(() {
                        var1 = num4;
                        var2 = num2;
                        var3 = num3;
                        var4 = num1;
                      });
                    }
                    if (num5 == 4) {
                      setState(() {
                        var1 = num1;
                        var2 = num2;
                        var3 = num4;
                        var4 = num3;
                      });
                    }
                    if (num5 == 3) {
                      setState(() {
                        var1 = num4;
                        var2 = num1;
                        var3 = num2;
                        var4 = num3;
                      });
                    }
                    ;
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 350,
                width: 250,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Range : 100 to 200',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Remaining Chance ',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          Container(
                            width: 20,
                            color: Colors.green,
                            child: Text(
                              '$chance',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // Background color
                          onPrimary: Colors.amber,
                          // Text Color (Foreground color)
                        ),
                        child:
                            Text('(i) $var1', style: TextStyle(fontSize: 24)),
                        // Black foreground color
                        onPressed: () {
                          if (check == true) {
                            if (chance > 0) {
                              if (var1 == num1) {
                                correct++;
                                correctdialog();
                                setState(() {
                                  trying++;
                                  check = false;
                                  result.add("Try $trying  Right   $num1");
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
                                });
                              } else if (var1 != num1 && chance == 2) {
                                setState(() {
                                  chance--;
                                });
                                wrongdialog();
                              } else if (chance == 1 && var1 != num1) {
                                setState(() {
                                  trying++;
                                  chance--;
                                });

                                result.add("Try $trying  Wrong   $num1");
                                wrongdialog();
                              }
                            } else {
                              chanceoverdialog();
                            }
                          } else {
                            checking();
                          }
                          // Code to execute when the button is pressed
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // Background color
                          onPrimary: Colors.amber,
                          // Text Color (Foreground color)
                        ),
                        child:
                            Text('(ii) $var2', style: TextStyle(fontSize: 24)),
                        // Black foreground color
                        onPressed: () {
                          if (check == true) {
                            if (chance > 0) {
                              if (var2 == num1) {
                                correct++;
                                correctdialog();
                                setState(() {
                                  trying++;
                                  check = false;
                                  result.add("Try $trying  Right   $num1");
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
                                });
                              } else if (var2 != num1 && chance == 2) {
                                setState(() {
                                  chance--;
                                });
                                wrongdialog();
                              } else if (chance == 1 && var2 != num1) {
                                setState(() {
                                  trying++;
                                  chance--;
                                });
                                result.add("Try $trying  Wrong   $num1");
                                wrongdialog();
                              }
                            } else {
                              chanceoverdialog();
                            }
                          } else {
                            checking();
                          }
                          // Code to execute when the button is pressed
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // Background color
                          onPrimary: Colors.amber,
                          // Text Color (Foreground color)
                        ),
                        child:
                            Text('(iii) $var3', style: TextStyle(fontSize: 24)),
                        // Black foreground color
                        onPressed: () {
                          if (check == true) {
                            if (chance > 0) {
                              if (var3 == num1) {
                                correct++;
                                correctdialog();
                                setState(() {
                                  trying++;
                                  check = false;
                                  result.add("Try $trying  Right   $num1");
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
                                });
                              } else if (var3 != num1 && chance == 2) {
                                setState(() {
                                  chance--;
                                });
                                wrongdialog();
                              } else if (chance == 1 && var3 != num1) {
                                setState(() {
                                  trying++;
                                  chance--;
                                });
                                result.add("Try $trying  Wrong   $num1");
                                wrongdialog();
                              }
                            } else {
                              chanceoverdialog();
                            }
                          } else {
                            checking();
                          }
                          // Code to execute when the button is pressed
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // Background color
                          onPrimary: Colors.amber,
                          // Text Color (Foreground color)
                        ),
                        child:
                            Text('(iv) $var4', style: TextStyle(fontSize: 24)),
                        // Black foreground color
                        onPressed: () {
                          if (check == true) {
                            if (chance > 0) {
                              if (var4 == num1) {
                                correct++;
                                correctdialog();
                                setState(() {
                                  trying++;
                                  check = false;
                                  result.add("Try $trying  Right   $num4");
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
                                });
                              } else if (var4 != num1 && chance == 2) {
                                setState(() {
                                  chance--;
                                });
                                wrongdialog();
                              } else if (chance == 1 && var4 != num1) {
                                setState(() {
                                  trying++;
                                  chance--;
                                });
                                result.add("Try $trying  Wrong   $num1");
                                wrongdialog();
                              }
                            } else {
                              chanceoverdialog();
                            }
                          } else {
                            checking();
                          }
                          // Code to execute when the button is pressed
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // Background color
                        onPrimary: Colors.amber,
                        // Text Color (Foreground color)
                      ),
                      child:
                          Text('Show Result', style: TextStyle(fontSize: 24)),
                      // Black foreground color
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => screen3()));
                      },
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // Background color
                        onPrimary: Colors.amber,
                        // Text Color (Foreground color)
                      ),
                      child: Text('      Retry       ',
                          style: TextStyle(fontSize: 24)),
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
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
