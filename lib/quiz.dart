import 'package:quiz_app/data/questions.dart';
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
  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void showResultScreen() {
    setState(() {
      activeScreen = 'result-screen';
    });
  }

  void addAnswer(QuizAnswer answer) {
    if (answers.length == questions.length) {
      showResultScreen();
    } else {
      answers.add(answer);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      widget = QuestionsScreen(
          addAnswer: addAnswer,
          showResultScreen: showResultScreen
      );
    }

    if (activeScreen == 'result-screen') {
      widget = ResultScreen(
        chosenAnswers: answers,
        restartQuiz: () {
          setState(() {
            activeScreen = 'start-screen';
            answers.clear();
          });
        },
      );
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
