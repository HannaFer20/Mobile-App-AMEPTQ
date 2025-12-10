import 'package:flutter/material.dart';

class LevelBanner extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onBackPressed;

  const LevelBanner({
    Key? key,
    required this.label,
    required this.color,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_circle_left, color: Colors.white, size: 32),
            onPressed: onBackPressed,
          ),
          Expanded(
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 48), // Espacio para equilibrar el icono de la izquierda
        ],
      ),
    );
  }
}