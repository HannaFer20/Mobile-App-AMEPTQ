// lib/components/bottom_navbar.dart
import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    // NOTA: Esta BottomNavbar es la de los botones de navegación.
    // La barra de objetos a buscar estará DENTRO de KitchenScreen, encima de esta.
    return Positioned(
      bottom: 0, // Ajustar a 0 si la barra de objetos está encima
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, -4),
              color: Colors.black26,
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home, color: Colors.white, size: 30),
            Icon(Icons.person, color: Colors.white, size: 30),
            Icon(Icons.settings, color: Colors.white, size: 30),
          ],
        ),
      ),
    );
  }
}