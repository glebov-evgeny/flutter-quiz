import 'package:flutter/material.dart';

class WrapperContainer extends StatelessWidget {
  const WrapperContainer(this.color, {super.key});

  final Color color;
  @override
  Widget build(context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Вопросы о самом главном',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[800],
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
              child: const Text(
                'начать',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
