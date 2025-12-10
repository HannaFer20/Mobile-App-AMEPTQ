import 'package:flutter/material.dart';

class FeedbackIcon extends StatelessWidget {
  final bool isCorrect; // true = palomita verde, false = cruz roja

  const FeedbackIcon({Key? key, required this.isCorrect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: isCorrect ? Colors.green : Colors.red,
          width: 5,
        ),
      ),
      child: Icon(
        isCorrect ? Icons.check : Icons.close,
        color: isCorrect ? Colors.green : Colors.red,
        size: 50,
      ),
    );
  }
}