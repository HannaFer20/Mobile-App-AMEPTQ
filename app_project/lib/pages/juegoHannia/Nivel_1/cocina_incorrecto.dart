import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              '../../../images/juegoHannia/CocinaIncorrecto.png', // Imagen de "Oh, no!"
              fit: BoxFit.cover,
            ),
          ),

          // Botón invisible sobre "Volver a Intentar"
          Positioned(
            // Ajusta la posición vertical
            bottom: size.height * 0.15,
             // Ajusta la posición horizontal y el ancho
            left: size.width * 0.15,
            right: size.width * 0.15,
            child: GestureDetector(
              onTap: () {
                // Vuelve a la pantalla anterior para intentar de nuevo
                Navigator.pop(context);
              },
              child: Container(
                // Altura aproximada del botón en la imagen
                height: 70,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}