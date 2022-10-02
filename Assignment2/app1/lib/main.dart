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
        body:Container(
          color: Colors.white,
          child: Padding(
          padding: EdgeInsets.only(left:30, bottom: 30, right: 30, top:5),
            child: Column(

              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [





                    Text("Hi, Junaid!",

                      style: const TextStyle(fontWeight: FontWeight.bold),),

                    Icon(Icons.add_alert_rounded),



                  ],),
                SizedBox(height: 5),
                Row(children: [

                  Text("What whould you buy today?",
                    style: TextStyle(fontSize: 13, color: Colors.grey,),
                  ),

                ],

                ),
                SizedBox(height: 5),
                Container(
                  height: 100,

                  width: double.maxFinite,
                  child: Card(
                    color: Color.fromRGBO(204, 255, 204,1),
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(left:30, bottom: 5, right: 30, top:20),
                          child: Align(

                              alignment: Alignment.centerLeft,

                              child:Column( children: [
                                Text("Enjoy the Spacial offer",
                                  style: TextStyle(fontSize: 12,color: Color.fromRGBO(24, 201, 112,1),fontWeight: FontWeight.bold),

                                ),
                                Text("up to 60%                          ",
                                  style: TextStyle(fontSize: 11, color: Color.fromRGBO(24, 201, 112,1),fontWeight: FontWeight.bold),

                                ),
                                Text("at 15-25 March 2021",
                                  style: TextStyle(fontSize: 12, color: Colors.grey,),
                                  textAlign: TextAlign.left,

                                ),
                              ],


                              )
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Catagories",style: const TextStyle(fontWeight: FontWeight.bold),),
                    Text("See All")
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(

                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SizedBox(
                              width: 80,
                              height: 80,
                              child: ClipOval(
                                child: Image.asset("assets/strabery.png",
                                ),
                              )
                          ),
                        ),
                        Text("food"),
                      ],
                    ),



                    Column(

                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SizedBox(
                              width: 80,
                              height: 80,
                              child: ClipOval(
                                child: Image.asset("assets/bread.png",
                                ),

                              )
                          ),
                        ),
                        Text("Bread"),
                      ],
                    ),
                    Column(

                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SizedBox(
                              width: 80,
                              height: 80,
                              child: ClipOval(
                                child: Image.asset("assets/veg1.png",
                                ),
                              )
                          ),
                        ),
                        Text("Vegie"),
                      ],
                    ),
                    Column(

                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SizedBox(
                              width: 80,
                              height: 80,
                              child: ClipOval(
                                child: Image.asset("assets/chease.png",
                                ),
                              )
                          ),
                        ),
                        Text("Dairy"),
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Best Selling",style: const TextStyle(fontWeight: FontWeight.bold),),
                    Text("See All")
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  height: 100,

                  width: double.maxFinite,
                  child: Card(
                    color: Color.fromRGBO(245, 245, 245,1),
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(left:30, bottom: 5, right: 30, top:20),
                          child: Align(

                              alignment: Alignment.centerLeft,

                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: ClipOval(
                                        child: Image.asset("assets/orange.png",
                                        ),
                                      )
                                  ),
                                ),

                                Column(

                                  children: [
                                  Text("Orange Fresh juice",style: const TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,),


                                  Text("Scrambled middle there Scrambled ",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey,),
                                    textAlign: TextAlign.left,),
                                  Text("generators De to alteration",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey,),
                                    textAlign: TextAlign.left,),
                                  Row(
                                    children: [
                                    Text("Rs 59.99",style: const TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold,  color: Colors.grey,),),
                                    Text("    Rs 49.99",style: const TextStyle(fontWeight: FontWeight.bold),),


                                  ],)


                                ],),
                                Icon(Icons.heart_broken_sharp,color: Colors.green,),

                              ],


                              )
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 100,

                  width: double.maxFinite,
                  child: Card(
                    color: Color.fromRGBO(245, 245, 245,1),
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(left:30, bottom: 5, right: 30, top:20),
                          child: Align(

                              alignment: Alignment.centerLeft,

                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: ClipOval(
                                          child: Image.asset("assets/cart.png",
                                          ),
                                        )
                                    ),
                                  ),

                                  Column(

                                    children: [
                                      Text("Fresh Carrot",style: const TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,),


                                      Text("Majority as first repeat century ",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey,),
                                        textAlign: TextAlign.left,),
                                      Text("embaraceing the majority",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey,),
                                        textAlign: TextAlign.left,),
                                      Row(
                                        children: [

                                          Text("    Rs 49.99",style: const TextStyle(fontWeight: FontWeight.bold),),


                                        ],)


                                    ],),
                                  Icon(Icons.heart_broken_sharp,color: Colors.green,),

                                ],


                              )
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 100,

                  width: double.maxFinite,
                  child: Card(
                    color: Color.fromRGBO(245, 245, 245,1),
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(left:30, bottom: 5, right: 30, top:20),
                          child: Align(

                              alignment: Alignment.centerLeft,

                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: ClipOval(
                                          child: Image.asset("assets/grapes.png",
                                          ),
                                        )
                                    ),
                                  ),

                                  Column(

                                    children: [
                                      Text("Juicy Grapes",style: const TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,),


                                      Text("Majority as first repeat century ",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey,),
                                        textAlign: TextAlign.left,),
                                      Text("embaraceing the majority",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey,),
                                        textAlign: TextAlign.left,),
                                      Row(
                                        children: [

                                          Text("    Rs 70.99",style: const TextStyle(fontWeight: FontWeight.bold),),


                                        ],)


                                    ],),
                                  Icon(Icons.heart_broken_sharp,color: Colors.green,),

                                ],


                              )
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  color: Colors.white30,
                  child: Card(
                    color: Color.fromRGBO(245, 245, 245,1),
                    elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.home,color: Colors.green,),
                      Icon(Icons.search_rounded),
                      Icon(Icons.shopping_cart),
                      Icon(Icons.person),
                    ],

                  ),
                ),
                ),












              ],),
          ),

    ),


      )
    );
  }
}
