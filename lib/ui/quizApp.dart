import 'package:flutter/material.dart';
import 'package:myflutterapp/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "The U.S Declaration of Indepence was adopted in 1776.", true),
    Question.name("The Supreme law of hte land is the Constitution", true),
    Question.name("Journalist is one branch or part of the government", false),
    Question.name("The U.S Constitution has 26 amendments", false),
    Question.name("The Congress doesnot make federal laws", false),
    Question.name("There as 100 U.S Senetors", true),
    Question.name("We elect a U.S. representative for 2 years", true),
    Question.name("We vote for President in January", false),
    Question.name("We elect a U.S. senetor for 4 years", true),
    Question.name("Who vetoes bills is the President", false),
    Question.name(
        "The two rights in the declaration of Independence are:"
        " \n Life "
        " \n Pursuit of happiness  ",
        true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        // backgroundColor: Colors.blueGrey,
      ),
      // backgroundColor: Colors.blueGrey,
      // we used builder here to use a context that is a descendant of Scaffold
      // or else Scaffold.of() will return null
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/flag.png",
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                    //  style: TextStyle(color: Colors.white, fontSize: 16.9),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      onPressed: () => _prevQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ))
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
        content: Text("Correct!"),
        duration: Duration(milliseconds: 500),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text("Incorrect!"));
      Scaffold.of(context).showSnackBar(snackbar);
    }

    _nextQuestion();
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
