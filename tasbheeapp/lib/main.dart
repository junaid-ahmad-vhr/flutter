import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: tasbhee() //create new class for 'home' property of MaterialApp()
      
    );
  }
}

class tasbhee extends StatefulWidget {
  const tasbhee({Key? key}) : super(key: key);

  @override
  State<tasbhee> createState() => _tasbheeState();
}

class _tasbheeState extends State<tasbhee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    centerTitle: true,
    title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    height: 30,
    width: 30,
    child:Image(
    image: AssetImage("assets/tasbhee-removebg-preview.png"),
    fit: BoxFit.cover),
    ),


    const SizedBox(
    width: 10,
    ),
    const Text(
    'Tasbhee App',
    style: TextStyle(color: Colors.amber),
    ),
    ],
    ),
    backgroundColor: Colors.black87, //<-- SEE HERE

    ),
    body:
    Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 50,
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Custom Tasbhee', style: TextStyle(color: Colors.amber),),
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.black,
                  ),
                    onPressed:() {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Expanded(
                            child: AlertDialog(
                              title: Text('Welcome'),
                              content: Text('GeeksforGeeks'),
                              actions: [
                                TextButton(

                                  onPressed: () {},
                                  child: Text('CANCEL'),
                                ),
                                TextButton(

                                  onPressed: () {},
                                  child: Text('ACCEPT'),
                                ),
                              ],
                            ),
                          );
                        },
                      );

                    }

                ),
                ElevatedButton(
                  child: Text('Saved Tasbhee', style: TextStyle(color: Colors.amber),),
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
    SizedBox(
      height: 30,
    ),
    Center(
      child:Padding(
        padding: const EdgeInsets.all(13.0),
        child: Center(
          child: Column(

          )
        ),
      )
    ),
    
        ],
      ),
    )
    );

  }
}





