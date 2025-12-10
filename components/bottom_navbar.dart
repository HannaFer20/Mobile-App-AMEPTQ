import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => debugPrint('Ir al inicio'),
              child: Image.asset(
                'images/boton_inicio.png',
                width: 40,
                height: 40,
              ),
            ),
            GestureDetector(
              onTap: () => debugPrint('Ir al perfil'),
              child: Image.asset(
                'images/boton_perfil.png',
                width: 40,
                height: 40,
              ),
            ),
            GestureDetector(
              onTap: () => debugPrint('Ir a configuraciones'),
              child: Image.asset(
                'images/boton_configuracion.png',
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}