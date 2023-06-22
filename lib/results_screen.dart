import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_quiz/question_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity, // max-width:100%
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertical aligment
          children: [
            Text(
              'Вы ответили на $numCorrectQuestions из $numTotalQuestions вопросов!',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: Text(
                'Повторить',
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
