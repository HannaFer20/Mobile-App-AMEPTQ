import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tamaño de la pantalla para ayudar con el posicionamiento
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // 1. La imagen de fondo
          Positioned.fill(
            child: Image.asset(
              '../../images/juegoHannia/NivelCocina.png', // Tu imagen de la cocina
              fit: BoxFit.contain, // Cubre toda la pantalla
            ),
          ),

          // 2. Los botones invisibles
          Positioned(
            // Ajusta este valor para subir/bajar la fila de botones
            bottom: size.height * 0.12, 
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // --- Botón 1: Agua (Incorrecto) ---
                _buildInvisibleButton(
                  context,
                  routeName: '/error',
                  size: size.width * 0.25, // Tamaño aproximado del círculo
                ),

                // --- Botón 2: Tapa (Correcto) ---
                _buildInvisibleButton(
                  context,
                  routeName: '/success',
                  size: size.width * 0.25,
                ),

                // --- Botón 3: Soplar (Incorrecto) ---
                _buildInvisibleButton(
                  context,
                  routeName: '/error',
                  size: size.width * 0.25,
                ),
              ],
            ),
          ),
          
          // Botón invisible para la flecha de "atrás" en la esquina superior izquierda
          Positioned(
            top: size.height * 0.04,
            left: size.width * 0.04,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Si hubiera una pantalla previa
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent, // Color transparente para ser invisible
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Función auxiliar para crear los botones invisibles
  Widget _buildInvisibleButton(BuildContext context, {required String routeName, required double size}) {
    return GestureDetector(
      onTap: () {
        // Navega a la ruta especificada
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        width: size,
        height: size,
        // Es IMPORTANTE que el color sea transparente para detectar el toque, 
        // si se deja en null, no detectará nada.
        color: Colors.transparent,
      ),
    );
  }
}