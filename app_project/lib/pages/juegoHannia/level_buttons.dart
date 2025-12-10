import 'package:flutter/material.dart';
import 'app_colors.dart'; // Importa tus colores

// 3.1 Botón estilo "Jugar" (Con efecto 3D)
class PlayButton extends StatelessWidget {
  final VoidCallback onTap;

  const PlayButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.btnWood,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.brown.shade700, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.shade800,
              offset: const Offset(0, 4), // Efecto de profundidad
              blurRadius: 0,
            )
          ],
        ),
        child: const Text(
          "JUGAR",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}

// 3.2 Botones de Acción (Continuar / Volver)
class ActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const ActionButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}