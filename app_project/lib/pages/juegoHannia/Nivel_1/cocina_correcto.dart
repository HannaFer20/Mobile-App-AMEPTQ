import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              '../../../images/juegoHannia/CocinaCorrecto.png', // Imagen de "Bien hecho"
              fit: BoxFit.cover,
            ),
          ),

          // Botón invisible sobre "Continuar"
          Positioned(
            // Ajusta la posición vertical
            bottom: size.height * 0.15,
            // Ajusta la posición horizontal y el ancho
            left: size.width * 0.15,
            right: size.width * 0.15,
            child: GestureDetector(
              onTap: () {
                // Vuelve a la pantalla anterior
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