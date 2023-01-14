import 'package:flutter/material.dart';
import 'database.dart';


final dbHelper = DatabaseHelper();
class sql extends StatefulWidget {
  const sql({Key? key}) : super(key: key);

  @override
  State<sql> createState() => _sqlState();
}

class _sqlState extends State<sql> {
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
        body:Center(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: dbHelper.mydb().then((db) => dbHelper.queryAllRows()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Map<String, dynamic>>? rows = snapshot.data;
                return ListView.builder(
                  itemCount: rows?.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> list = rows![index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 5,
                              child: Column(
                                children: [
                                  Row(


                                    children: [
                                      Text("     GAME RESULT",style: TextStyle(color: Colors.green),),
                                      SizedBox(
                                        width: 20,
                                      ),

                                      Spacer(),
                                      TextButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,

                                          ),
                                          onPressed: () async {
                                            Map<String, dynamic> row = {
                                              DatabaseHelper.columnId:
                                              list['_id'],

                                            };
                                            final rowsAffected =
                                            await dbHelper
                                                .Delete(row);
                                            setState(() {
                                              sql();
                                            });
                                          }  ,

                                          child:
                                              Text("Delete"),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                    ],

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 15, right: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Correct Guess",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Spacer(),
                                        Text(
                                          list['correct'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 15, right: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Total Tries Paly",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Spacer(),
                                        Text(
                                          list['total'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                    // return ListTile(
                    //   title: Text(list['phone']),
                    //   subtitle: Text(list['reg'].toString()),
                    // );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),

        );
  }
}
