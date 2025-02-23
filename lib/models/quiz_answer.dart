import 'package:quiz_app/models/quiz_question.dart';

class QuizAnswer {
  final String answer;
  final QuizQuestion question;

  QuizAnswer({required this.answer, required this.question});

  bool get isCorrect {
    return answer == question.answer;
  }
}
