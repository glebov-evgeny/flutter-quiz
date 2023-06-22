import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAnswer extends StatelessWidget {
  const ButtonAnswer(
      {super.key, required this.label, required this.onTapClick});

  final String label;
  final void Function() onTapClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 193, 15, 3),
        foregroundColor: Colors.white,
        shadowColor: Colors.amber,
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 40,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
