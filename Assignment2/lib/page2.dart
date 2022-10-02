import 'package:flutter/material.dart';

void main(){
  runApp(Assignment2());
}
class Assignment2 extends StatelessWidget{
  const Assignment2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left:30, bottom: 30, right: 30, top:5),
          child: Column(

            children: [
              Row(
                children: [
            Text("Helow Junaid,",
            style: TextStyle(fontSize: 15, color: Colors.orange,),
            ),

                ],

              ),
              Row(
                children: [
                  Text("Excited to cook something new today?",
                    style: TextStyle(fontSize: 13, color: Colors.grey,),
                  ),


                ],

              ),
              Container(
                height: 100,

                width: double.maxFinite,
                child: Card(
                  color: Color.fromRGBO(255, 235, 235,1),
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(left:30, bottom: 5, right: 30, top:20),
                        child: Align(

                            alignment: Alignment.centerLeft,

                            child:Row(

                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 30,
                                  child: SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: ClipOval(
                                        child: Image.asset("assets/cook.png",
                                        ),
                                      )
                                  ),
                                ),

                                Column(

                                  children: [
                                    Text("                 You have 12 recipes",style: const TextStyle(fontWeight: FontWeight.bold),
                                ),


                                    Text("                  You haven't tried yet ",style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text("See recipes",style: const TextStyle(decoration:TextDecoration.underline,fontWeight: FontWeight.bold, fontSize: 12, color: Colors.orange,),
                                    ),



                                  ],),


                              ],


                            )
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
               height: 10,
             ),
              Container(
                height: 220,
                  width: double.infinity,

                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/table.png"),
                      fit: BoxFit.cover),
                ),
                 child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.orange,

                            child:Text("Non Veg",style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ),

                          Icon(Icons.bookmark,color: Colors.orange, size: 50.0),
                        ],
                      ),
                      SizedBox(
                        height:70,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("  Chicken Makhni",
                                style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                              Text("South Special",
                                style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                              Text("30 Recipes | 1 Serving",
                                style: TextStyle(fontSize: 10, color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),





                    ],
                  )
                ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Trending Recipe",
                    style: TextStyle(fontSize: 15, color: Colors.black,),
                  ),

                ],

              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                      height: 100,
                      width: 190,

                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/south.png"),
                            fit: BoxFit.cover),
                      ),
                      child: Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.grey,

                                child:Text("South",style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),






                        ],
                      )
                  ),
                  SizedBox(
                    width:10,
                  ),
                  Container(
                      height: 100,
                      width: 190,

                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/nonveg.png"),
                            fit: BoxFit.cover),
                      ),
                      child: Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: Colors.grey,

                                child:Text("Non Veg",style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),






                        ],
                      )
                  ),
                ],
              ),
              SizedBox(
                height:10,
              ),
              Container(
                height:60,


                color: Colors.white30,
                child: Card(
                  color: Color.fromRGBO(245, 245, 245,1),
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.home,color: Colors.orange,),
                      Icon(Icons.menu_book,color: Colors.orange,),
                      Icon(Icons.coffee_outlined,color: Colors.orange,),
                      Icon(Icons.person,color: Colors.orange,),
                    ],

                  ),
                ),
              ),
            ],




            ),
          ),

        ),
        )
    );
  }
}
