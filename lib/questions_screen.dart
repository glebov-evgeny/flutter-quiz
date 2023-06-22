import 'package:flutter/material.dart';

import 'package:flutter_quiz/button_answer.dart';
import 'package:flutter_quiz/data/questions.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // max-width:100%
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertical aligment
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
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
            ...currentQuestion.getShuffledAnswer().map(
              (answer) {
                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 12,
                  ),
                  child: ButtonAnswer(
                    label: answer,
                    onTapClick: () {
                      answerQuestion(answer);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
