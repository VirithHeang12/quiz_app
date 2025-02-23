import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_answer.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.chosenAnswers, required this.restartQuiz, super.key});

  final List<QuizAnswer> chosenAnswers;
  final void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final correctAnswers = chosenAnswers.where((answer) => answer.isCorrect).length;

    final percentage = (correctAnswers / totalQuestions) * 100;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $correctAnswers out of $totalQuestions questions correctly!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Your score is ${percentage.toStringAsFixed(2)}%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: restartQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt, size: 30),
            label: const Text('Restart Quiz',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}