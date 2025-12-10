import 'package:flutter/material.dart';
import 'app_colors.dart'; // Asegúrate de importar tus colores


class WinnerScreen extends StatelessWidget {
  const WinnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. IMAGEN DE FONDO (Pantalla completa, ajustada)
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                // Usa la imagen que subiste
                image: AssetImage('../images/juegoHannia/winner.png'), 
                fit: BoxFit.cover, // Cubre toda la pantalla
              ),
            ),
          ),

          // 2. BOTÓN "VOLVER" (Abajo)
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btnRed, // Rojo para salir, o usa btnWood
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    // Opción A: Volver a la pantalla de inicio (borrando historial)
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    
                    // Opción B: Si tienes un menú de juegos, regresa ahí:
                    // Navigator.pop(context); 
                  },
                  child: const Text(
                    "VOLVER AL MENÚ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}