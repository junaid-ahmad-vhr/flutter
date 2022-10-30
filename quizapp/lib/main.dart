import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
int correct=0;
int wrong=0;
int m=5;
int c=0;
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
  final fieldText = TextEditingController();
  String   questionText="";
  bool  questionAnswer=true;

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
            'Quiz App',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.black, //<-- SEE HERE

    ),
    body: Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        color: Colors.cyanAccent,

      child:Column(


      children: [
      SizedBox(
      height: 40,
      ),
      Container(
      color: Colors.black87,
      height: 30,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Plese Enter $m Question",textAlign: TextAlign.center,style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: 'Open Sans',
        fontSize: 15),),
      ),),
      SizedBox(
      height: 30,
      ),
         TextField(

           controller:  fieldText,
           decoration: InputDecoration(
             hintText: "Enter Your Question?",
               border: OutlineInputBorder(),
             suffixIcon: IconButton(
               onPressed:(){
                 fieldText.clear();
               },
                 icon: const Icon(Icons.clear_rounded)
             ),


           ),


         ),
            const SizedBox(
              height: 8,
            ),

            SizedBox(
              height:100, //height of button
              width:300, //width of button
              child: ElevatedButton(


                onPressed: (){

                  questionAnswer=true;
                  questionText=fieldText.text;
                  quizBrain.insertquestion(questionText,questionAnswer);
                  fieldText.clear();
                  c++;
                  if(c==5){
                    Alert(
                      context: context,
                      title: 'Success!',
                      desc: 'You\'ve enterd five question?',
                    ).show();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  QuizPage()),
                    );

                  }
                  setState(() {
                    m--;
                  });



                },

                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(8),

                      backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent)),
                  child: const Text('true',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                      fontSize: 20),),),
            ),

            SizedBox(
              height: 20,
            ),
        SizedBox(
          height:100, //height of button
          width:300, //width of button
          child: ElevatedButton(


              onPressed: (){
                questionAnswer=false;
                questionText=fieldText.text;
                quizBrain.insertquestion(questionText,questionAnswer);
                fieldText.clear();
                c++;
                if(c==5){
                  Alert(
                    context: context,
                    title: 'Success!',
                    desc: 'You\'ve enterd five question?',
                  ).show();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  QuizPage()),
                  );

                }


              },

              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(8),

                  backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
              child: const Text('false',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Open Sans',
                  fontSize: 20),),),
        ),
            SizedBox(
              height: 10,
            ),





  ])
        ),
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
        //TODO Step 4 Part A - show an alert using rFlutter_alert
        // ,
        if (userPickedAnswer == correctAnswer) {
          correct++;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          wrong++;
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.\n Corrrect Answer=$correct\nwrong Answer=$wrong',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
        correct=0;
        wrong=0;
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          correct++;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          wrong++;
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            'Quiz App',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.black, //<-- SEE HERE

    ),
    body: Padding(
      padding: const EdgeInsets.all(11.0),
      child: Container(
        color: Colors.cyanAccent,
        child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(

        child:Column(


        children: [
        SizedBox(
        height: 40,
        ),



          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children:[

              Center(
                    child: Text(
                      //quizBrain.getQuestionText(),
                      //getQuestion!,
                      quizBrain.getQuestionText().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ),

              SizedBox(
                height:100, //height of button
                width:300,
                child: TextButton(
                      style: TextButton.styleFrom(

                        backgroundColor: Colors.lightGreen, // Background Color
                      ),
                      child: Text(
                        'True',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 20),),
                      onPressed: () {
                        quizBrain.getQuestionText().toString();
                        //The user picked true.
                        checkAnswer(true);
                      },
                    ),
              ),
              SizedBox(
                height: 50,
              ),

                  SizedBox(
                    height:100, //height of button
                    width:300,
                    child: TextButton(
                      style: TextButton.styleFrom(

                        backgroundColor: Colors.redAccent, // Background Color
                      ),
                      child: Text(
                        'False',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 20),),
                      onPressed: () {
                        quizBrain.getQuestionText().toString();
                        //The user picked false.
                        checkAnswer(false);
                      },
                    ),
                  ),
              Row(
                children: scoreKeeper,
              ),
            SizedBox(
              height: 30,
            ),
              SizedBox(
                height:30, //height of button
                width:100,
                child: TextButton(
                  style: TextButton.styleFrom(

                    backgroundColor: Colors.deepPurple, // Background Color
                  ),
                  child: Text(
                    'Restart',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    quizBrain.resetlist();
                    m=5;
                    c=0;
                    scoreKeeper=[];
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  start()),
                    );

                  },
                ),
              ),

            ],
          )
  ]
        )
        )
        ),
      ),
    )
    )
    );
  }
}

