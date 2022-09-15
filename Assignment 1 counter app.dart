// Name Junaid Ahmad  Reg sp19-bcs-013
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment # 1 ',
      theme: ThemeData(

      ),
      home: const MyHomePage(title: 'Assignment # 1  Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {

      _counter--;
    });
  }
  void _reset() {
    setState(() {

      _counter=0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin:EdgeInsets.all(10),
                child: FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add)
                )
            ), //button first

            Container(
                margin:EdgeInsets.all(10),
                child: FloatingActionButton(
                    onPressed: _reset,
                    tooltip: 'reset',
                    child: const Icon(Icons.delete)
                )
            ), // button second

            Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'decrement',
                  child: const Icon(Icons.remove)
              ),
            ), // button third
            const Text(
              'RESULT',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

    );
  }
}
