import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:alert/alert.dart';
void main() => runApp(Quizzler());
int i=0;
Quizbrain quizbrain = Quizbrain();
class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [

  ];
  void checkAnswer(bool userPickedAnswer)
  {
    bool correctAnswer = quizbrain.getQuestionAnswer(que) ;
    setState(() {
    if(userPickedAnswer==correctAnswer)
    {
      scoreKeeper.add(
        Icon(
          Icons.check,
          color:Colors.green,
        ),
      );
      print('User entered correct answer');
    }
    else
    {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
      print('User got it wrong');
    }
//set state used for re building
      quizbrain.nextQuestion();
    },
    );
  }
  //Question q1 = Question(q: 'You can lead a cow down stairs not up stairs.', a: false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQuestionText(que),
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
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
            setState(() {
              checkAnswer(true);
            });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
              setState(() {
                checkAnswer(false);
              });
              },
            ),
          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child:FlatButton(
                onPressed: (){
                  Alert(message: 'Test').show();
                },
                child: Text('Show Alert'),
              ),
            ),
        ),
        Row(
          children: scoreKeeper,
        )
        //TODO: Add a Row here as your score keeper
      ],

    );

}
}