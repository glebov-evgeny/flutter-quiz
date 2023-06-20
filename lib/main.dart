import 'package:flutter/material.dart';
import 'package:flutter_quiz/wrapper_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: WrapperContainer(
          Color.fromARGB(255, 0, 67, 108),
        ),
      ),
    ),
  );
}
