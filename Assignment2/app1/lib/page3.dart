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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 350,
                          ),
                          Text("Current Location",
                            style: TextStyle(fontSize: 10, color: Colors.grey,),
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on,color: Colors.deepPurple,),
                              Text("vehari, pak",
                                style: TextStyle(fontSize: 10, color: Colors.black,fontWeight: FontWeight.bold,),
                              ),
                            ],
                          )

                        ],
                      ),

                      Icon(Icons.location_on,color: Colors.deepPurple,),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(

                    color: Colors.black12,
                    height: 35,
                    child: Row(
                      children: [
                        Icon(Icons.search,color: Colors.deepPurple,),
                    Text("   Search a Doctor or health issue",
                      style: TextStyle(fontSize: 15, color: Colors.grey,),
                    ),

                      ],
                    ),

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Upcoming Schedule",style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text("See All",style: const TextStyle(color: Colors.deepPurple),)
                    ],
                  ),
                  Container(
                    height: 150,
                    color: Colors.deepPurpleAccent,
                    child: Column(
                      children: [
                        Row(

                          children: [
                    Padding(
                    padding: EdgeInsets.only(left:30, bottom: 30, right: 30, top:30),
                           child:Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               CircleAvatar(
                                 backgroundColor: Colors.transparent,
                                 child: SizedBox(
                                     width: 80,
                                     height: 80,
                                     child: ClipOval(
                                       child: Image.asset("assets/doc3.png",
                                       ),
                                     )
                                 ),
                               ),
                               SizedBox(
                                 width: 10,
                               ),
                               Column(
                                 children: [
                                   Text("Dr.Junaid Ahmad",
                                     style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold,),
                                   ),
                                   Text("Dermotologist",
                                     style: TextStyle(fontSize: 13, color: Colors.white,),
                                   ),
                                 ],
                               ),
                               SizedBox(
                                 width: 120,
                               ),
                               Icon(Icons.video_call_rounded,color: Colors.white,),

                             ],

                           )

                    ),

                          ],
                        ),
              Padding(
                padding: EdgeInsets.only(left:30, bottom: 0, right: 30, top:0),
                child: Container(
                  height: 40,
                  color: Colors.deepPurple,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.access_time_filled_sharp,color: Colors.grey,),
                      Text("  Sun, Jan 19, 08:00am -10:00am",
                        style: TextStyle(fontSize: 15, color: Colors.grey,fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Let's find your doctor",style: const TextStyle(fontWeight: FontWeight.bold),),
                      Icon(Icons.equalizer,color: Colors.deepPurpleAccent,),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                          width: 170,
                        color: Colors.black12,
                        child: Row(
                          children: [
                            Icon(Icons.heart_broken,color: Colors.deepPurple,),
                            Text("cardiologist",
                              style: TextStyle(fontSize: 10, color: Colors.black,fontWeight: FontWeight.bold,),
                            ),
                          ],

                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 30,
                        width: 170,
                        color: Colors.black12,
                        child: Row(
                          children: [
                            Icon(Icons.remove_red_eye,color: Colors.deepPurple,),
                            Text("Ophthalmologist",
                              style: TextStyle(fontSize: 10, color: Colors.black,fontWeight: FontWeight.bold,),
                            ),
                          ],

                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(

                    height: 100,

                    width: double.maxFinite,


                    child: Card(
                      color: Colors.white70,

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
                                            child: Image.asset("assets/doc3.png",
                                            ),
                                          )
                                      ),
                                    ),

                                    Column(

                                      children: [
                                        Text("Dr. Anna Baker",style: const TextStyle(fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,),


                                        Text("heart surgen specialest ",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey,),
                                          textAlign: TextAlign.left,),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.amberAccent,),
                                            Icon(Icons.star,color: Colors.amberAccent,),
                                            Icon(Icons.star,color: Colors.amberAccent,),
                                            Icon(Icons.star,color: Colors.amberAccent,),
                                            Icon(Icons.star,color: Colors.amberAccent,),
                                            Text("4.5|120 Reviews",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey,),
                                              textAlign: TextAlign.left,),


                                          ],
                                        )


                                      ],),

                                  ],


                                )
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,

                    width: double.maxFinite,
                    child: Card(
                      color: Colors.white70,

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
                                            child: Image.asset("assets/doc2.png",
                                            ),
                                          )
                                      ),
                                    ),

                                    Column(

                                      children: [
                                        Text("Dr.Asim",style: const TextStyle(fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,),


                                        Text("eye surgen specialest ",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey,),
                                          textAlign: TextAlign.left,),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.amberAccent,),
                                            Icon(Icons.star,color: Colors.amberAccent,),
                                            Icon(Icons.star,color: Colors.amberAccent,),
                                            Icon(Icons.star,color: Colors.amberAccent,),
                                            Icon(Icons.star,color: Colors.amberAccent,),
                                            Text("4.5|120 Reviews",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey,),
                                              textAlign: TextAlign.left,),


                                          ],
                                        )


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
                    height: 3,
                  ),
                  Container(
                    color: Colors.white30,
                    child: Card(
                      color: Color.fromRGBO(245, 245, 245,1),
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.home,color: Colors.deepPurple,),
                          Icon(Icons.calendar_month_outlined),
                          Icon(Icons.message),
                          Icon(Icons.person),
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
