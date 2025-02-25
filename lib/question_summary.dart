import 'package:quiz_app/models/quiz_answer.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.chosenAnswers});

  final List<QuizAnswer> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: chosenAnswers.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final answer = chosenAnswers[index];
          return ListTile(
            title: Row(
              children: [
                Expanded(child: Text('${index + 1}. ${answer.question.question}')),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your answer: ${answer.answer}',
                  style: TextStyle(
                    color: answer.isCorrect ? Colors.green : Colors.red,
                  ),
                ),
                Text('Correct answer: ${answer.question.answer}',
                  style: const TextStyle(
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            trailing: Icon(
              answer.isCorrect ? Icons.check : Icons.close,
              color: answer.isCorrect ? Colors.green : Colors.red,
            ),
          );
        },
      ),
    );
  }

}