import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/start_screen.dart';
import 'package:flutter_quiz/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    // activeScreen = const ResultsScreen();
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = StartScreen(switchScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswers,
          onRestart: restartQuiz,
        );
      });
      selectedAnswers = [];
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(242, 111, 4, 1),
                Color.fromRGBO(13, 3, 72, 1),
                Color.fromRGBO(81, 0, 0, 1)
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
