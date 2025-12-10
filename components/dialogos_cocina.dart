// lib/components/feedback_dialog.dart
import 'package:flutter/material.dart';

class FeedbackDialog extends StatelessWidget {
  final String title;
  final String content;
  final Color color;
  final IconData icon;

  const FeedbackDialog({
    super.key,
    required this.title,
    required this.content,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Text(
          content,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK', style: TextStyle(fontSize: 18, color: Colors.blue)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}