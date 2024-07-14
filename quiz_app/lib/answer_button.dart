import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  // named arguments
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  }); // for accepting different answer text
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 119, 243, 238),
        foregroundColor: const Color.fromARGB(255, 23, 5, 114),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
