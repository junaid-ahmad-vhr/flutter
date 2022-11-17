import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
int Counter=0;
String tnmae="Astagfirullah";
final Name = TextEditingController();
final number = TextEditingController();
String varname=Name.text;
int  varnumber=int.parse(number.text);
String ? v;
List<ElevatedButton> mylist = [];
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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

                              title: Text('Custom Tesbhee '),
                              content: Container(
                                height: 200,
                                child: Column(
                                  children: [
                                    Text('Tesbhee Name'),

                                    TextField(

                                      controller:  Name,
                                      decoration: InputDecoration(
                                        hintText: "Allah",
                                        border: OutlineInputBorder(),
                                        suffixIcon: IconButton(
                                            onPressed:(){
                                              Name.clear();
                                            },
                                            icon: const Icon(Icons.clear_rounded)
                                        ),


                                      ),


                                    ),
                                    Text('Tasbhee Count'),
                                    TextField(

                                      controller:  number,
                                      decoration: InputDecoration(
                                        hintText: "plese enter less then 10000",
                                        border: OutlineInputBorder(),
                                        suffixIcon: IconButton(
                                            onPressed:(){
                                              number.clear();
                                            },
                                            icon: const Icon(Icons.clear_rounded)
                                        ),


                                      ),


                                    ),
                                    Text('$v')

                                  ],
                                ),
                              ),

                              actions: [
                                TextButton(

                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('CANCEL'),
                                ),
                                TextButton(

                                  onPressed: () {
                                    mylist.add( ElevatedButton(
                                      child: Row(
                                        children: [
                                        Text(varname, style: TextStyle(color: Colors.amber)),
                                        Text(varnumber.toString(), style: TextStyle(color: Colors.amber)),
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(

                                        backgroundColor: Colors.black,
                                      ),
                                      onPressed: () {},
                                    ));

                                  },
                                  child: Text('ADD Tesbhee'),
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
            children: [
              Text('$tnmae', style: TextStyle(color: Colors.amber,fontSize: 30),),
              SizedBox(height: 20,),
              Text(Counter.toString(), style: TextStyle(color: Colors.amber,fontSize: 30)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/c.png",
                        ),


                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        Counter++;
                      });

                      },


                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.amber,
                    ),
                  ),




                  SizedBox(width: 30,),
                  ElevatedButton(
                    child: CircleAvatar(
                      radius: 130,
                      backgroundColor: Colors.transparent,

                      child: ClipOval(
                        child: Image.asset("assets/reset.png",
                        ),


                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        Counter=0;
                      });
                    },


                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                width: 500,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/kaba.gif"),
                      fit: BoxFit.cover),
                ),

              ),

            ],

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





