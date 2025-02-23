import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_answer.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.addAnswer, required this.showResultScreen});

  final void Function(QuizAnswer) addAnswer;
  final void Function() showResultScreen;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex == questions.length - 1) {
        widget.showResultScreen();
      } else {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final shuffledOptions = currentQuestion.getShuffledOptions();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Question ${currentQuestionIndex + 1}',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
              )
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 500,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: shuffledOptions.length,
              itemBuilder: (context, index) {
                return AnswerButton(shuffledOptions[index], () {
                  widget.addAnswer(
                    QuizAnswer(
                      question: currentQuestion,
                      answer: shuffledOptions[index],
                    ),
                  );
                  nextQuestion();
                });
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
        ],
      ),
    );
  }
}
