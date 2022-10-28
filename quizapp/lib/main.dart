import 'package:flutter/material.dart';

//TODO: Step 2 - Import the rFlutter_Alert package here.
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

String  ? getQuestion ;

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: start(),
          ),
        ),
      ),
    );
  }
}
class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);


  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  // var to store
// onChanged callback
  late String title;
  String text = "No Value Entered";

  void _setText() {
    setState(() {
      text = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            child:Image(
                image: AssetImage("assets/quiz.jpg"),
                fit: BoxFit.cover),
          ),


          const SizedBox(
            width: 10,
          ),
          const Text(
            'Guess game',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.black, //<-- SEE HERE

    ),
    body: Container(

    width: double.infinity,
    height: double.infinity,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/quiz1.jpg"),
    fit: BoxFit.cover),
    ),
    child:Column(


    children: [
    SizedBox(
    height: 40,
    ),
    Container(
    color: Colors.black87,
    height: 30,
    width: 200,
    child: Text("Plese Enter Five Question",textAlign: TextAlign.center,style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    fontFamily: 'Open Sans',
    fontSize: 15),),),
    SizedBox(
    height: 30,
    ),
       TextField(
         decoration: InputDecoration(
           hintText: "Enter Your Question?",
             border: OutlineInputBorder()),

       ),
          const SizedBox(
            height: 8,
          ),

          ElevatedButton(
              onPressed: _setText,
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(8),
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text('Submit')),
          // RaisedButton is deprecated and should not be used
          // Use ElevatedButton instead

          // RaisedButton(
          //     onPressed: _setText,
          //     child: Text('Submit'),
          //     elevation: 8,
          // ),
          const SizedBox(
            height: 20,
          ),
          Text(text),
  ])
      )
    )
    );


  }
}




class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool? correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.white,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Expanded(
          flex: 7,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //quizBrain.getQuestionText(),
                //getQuestion!,
                getQuestion.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(

                backgroundColor: Colors.green, // Background Color
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                getQuestion = quizBrain.getQuestionText();
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(

                backgroundColor: Colors.red, // Background Color
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                getQuestion = quizBrain.getQuestionText();
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/