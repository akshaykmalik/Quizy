import 'package:flutter/material.dart';
import 'QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  QuizBrain quizBrain = QuizBrain();
  int i = 0;
  List<Icon> scoreKeeper = [];
  Expanded fun({String s, Color c}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: FlatButton(
          onPressed: () {
            fun2(s);
          },
          child: Text(s),
          color: c,
        ),
      ),
    );
  }

  fun2(String s) {
    setState(() {
      if (quizBrain.complete() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      } else if ((s.compareTo('True') == 0 && quizBrain.getAnswer() == true) ||
          (s.compareTo('False') == 0 && quizBrain.getAnswer() == false)) {
        scoreKeeper.add(Icon(
          Icons.check_circle,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.cancel,
          color: Colors.red,
        ));
      }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      quizBrain.getQuestion(),
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                fun(s: 'True', c: Colors.lightGreenAccent[400]),
                fun(s: 'False', c: Colors.red[400]),
                Row(
                  children: scoreKeeper,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
