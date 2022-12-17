import 'package:partywillingness/add_students.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
double p=0;
double p1=0;
double p2=0;
double p3=0;
double p4=0;
double p5=0;
void mm1() async{
  final m=await dbHelper.queryRowCount();
  final m1=await dbHelper.male();
  final m2=await dbHelper.female();
  final m3=await dbHelper.paid();
  final m4=await dbHelper.unpaid();
  final m5=await dbHelper.total();


  p=m.toDouble();
  p1=m1.toDouble();
  p2=m2.toDouble();
  p3=m3.toDouble();
  p4=m4.toDouble();
  p5=m5.toDouble();
  print(p);
}
class HomePage2 extends StatelessWidget {
  HomePage2({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "Total Student": p,
    "Paid": p1,
    "Unpaid": p2,
    "Male Student": p3,
    "Female Student": p4,


  };

  final colorList = <Color>[
    Colors.green,
    Colors.amber,
    Colors.pinkAccent,
    Colors.blue,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (title: Center(child:GradientText(
        'View Student Record',
        style: TextStyle(
          fontSize: 25.0,
        ),
        colors: [
          Colors.red,
          Colors.pinkAccent,
          Colors.teal,
          Colors.green,
          Colors.purple,

          //add mroe colors here.
        ],
      )),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GradientText(
              'PIE CHART',
              style: TextStyle(
                fontSize: 25.0,
              ),
              colors: [
                Colors.red,
                Colors.pinkAccent,
                Colors.teal,
                Colors.green,
                Colors.purple,

                //add mroe colors here.
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: PieChart(
                dataMap: dataMap,
                chartType: ChartType.ring,
                baseChartColor: Colors.grey[300]!,
                colorList: colorList,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 20,
              color: Colors.black,

            ),
            GradientText(
              'Total Collection= $p5',
              style: TextStyle(
                fontSize: 25.0,
              ),
              colors: [
                Colors.red,
                Colors.pinkAccent,
                Colors.teal,
                Colors.green,
                Colors.purple,

                //add mroe colors here.
              ],
            ),
            GradientText(
              'Total Student = $p',
              style: TextStyle(
                fontSize: 25.0,
              ),
              colors: [
                Colors.red,
                Colors.pinkAccent,
                Colors.teal,
                Colors.green,
                Colors.purple,

                //add mroe colors here.
              ],
            ),
            GradientText(
              'Male = $p1',
              style: TextStyle(
                fontSize: 25.0,
              ),
              colors: [
                Colors.red,
                Colors.pinkAccent,
                Colors.teal,
                Colors.green,
                Colors.purple,

                //add mroe colors here.
              ],
            ),
            GradientText(
              'Female =$p2',
              style: TextStyle(
                fontSize: 25.0,
              ),
              colors: [
                Colors.red,
                Colors.pinkAccent,
                Colors.teal,
                Colors.green,
                Colors.purple,

                //add mroe colors here.
              ],
            ),
            GradientText(
              'Paid =$p3',
              style: TextStyle(
                fontSize: 25.0,
              ),
              colors: [
                Colors.red,
                Colors.pinkAccent,
                Colors.teal,
                Colors.green,
                Colors.purple,

                //add mroe colors here.
              ],
            ),
            GradientText(
              'Unpaid = $p4',
              style: TextStyle(
                fontSize: 25.0,
              ),
              colors: [
                Colors.red,
                Colors.pinkAccent,
                Colors.teal,
                Colors.green,
                Colors.purple,

                //add mroe colors here.
              ],
            ),
          ],
        ),
      ),
    );
  }
}