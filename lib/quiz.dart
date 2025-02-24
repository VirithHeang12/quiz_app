import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/enums/screen.dart';
import 'package:quiz_app/models/quiz_answer.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<QuizAnswer> answers = [];
  Screen activeScreen = Screen.start;

  void switchScreen(Screen screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  void addAnswer(QuizAnswer answer) {
    answers.add(answer);

    if (answers.length == questions.length) {
      switchScreen(Screen.result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = StartScreen(switchScreen);

    switch (activeScreen) {
      case Screen.start:
        widget = StartScreen(
          switchScreen
        );
        break;
      case Screen.questions:
        widget = QuestionsScreen(
            addAnswer: addAnswer,
            showResultScreen: () => switchScreen(Screen.result)
        );
        break;
      case Screen.result:
        widget = ResultScreen(
          chosenAnswers: answers,
          restartQuiz: () {
            setState(() {
              activeScreen = Screen.start;
              answers.clear();
            });
          },
        );
        break;
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF5433FF), Color(0xFF20BDFF)])),
          child: widget,
        ),
        appBar: AppBar(
          title: const Text('Country Capital Quiz',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFF5433FF),
        ),
      ),
    );
  }
}
