import 'package:flutter/material.dart';

// Importa tus componentes
import 'pages/juegoHannia/game_level_screen.dart'; 
import 'pages/juegoHannia/level_data.dart';
import 'pages/juegoHannia/app_colors.dart';
import 'pages/juegoHannia/winner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seguridad en la Cocina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'VarelaRound',
      ),
      
      initialRoute: '/', 
      
      routes: {
        // ---------------------------------------------------------
        // RUTA INICIAL: CORREGIDA (ZOOM OUT)
        // ---------------------------------------------------------
        '/': (context) => Scaffold(
          // Puedes cambiar este color si el fondo de tu imagen 'escena_inicio' 
          // tiene un color específico (ej. naranja) para que se fusione mejor.
          backgroundColor: Colors.white, 
          
          body: Stack(
            children: [
              // CAPA 1: La imagen centrada y contenida (NO estirada)
              Center(
                child: Container(
                  // Esto asegura que la imagen no ocupe más del 85% del ancho de la pantalla
                  // dándote ese efecto de "lejos" o zoom out que buscas.
                  width: MediaQuery.of(context).size.width * 0.85,
                  // Si quieres restringir la altura también, descomenta esto:
                  // height: MediaQuery.of(context).size.height * 0.5, 
                  
                  child: Image.asset(
                    'images/juegoHannia/escena_inicio.png', 
                    fit: BoxFit.contain, // Muestra la imagen COMPLETA sin recortar nada
                  ),
                ),
              ),

              // CAPA 2: El botón JUGAR (Abajo)
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter, 
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60.0), // Margen desde abajo
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.btnWood, 
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/cocina'),
                      child: const Text(
                        "JUGAR",
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 26, 
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // ---------------------------------------------------------
        // RUTA NIVEL 1: COCINA (Sin cambios)
        // ---------------------------------------------------------
        '/cocina': (context) => GameLevelScreen(
              levelData: LevelData(
                id: '1',
                name: 'Cocina',
                color: AppColors.orangeLevel,
                scenarioImage: 'images/juegoHannia/escena_cocina.png', 
                correctOptionAsset: '../images/juegoHannia/botonTapa.png', 
                successMessage: "¡Bien hecho!\nCuando hay fuego con aceite, cúbrelo con una tapa y nunca uses agua o intentes soplar.",
                failureMessage: "¡Oh, no! ¡Eso no funciona!\nEs peligroso.",
                nextLevelRoute: '/sala', 
                optionAssets: [
                  '../images/juegoHannia/botonCubeta.png',
                  '../images/juegoHannia/botonTapa.png',
                  '../images/juegoHannia/botonSoplar.png',
                ],
              ),
            ),

        // ---------------------------------------------------------
        // RUTA NIVEL 2: SALA (Sin cambios)
        // ---------------------------------------------------------
        '/sala': (context) => GameLevelScreen(
              levelData: LevelData(
                id: '2',
                name: 'Sala',
                color: AppColors.purpleLevel,
                scenarioImage: 'images/juegoHannia/escena_sala.png', 
                correctOptionAsset: '../images/juegoHannia/botonExtintor.png', 
                successMessage: "¡Excelente! El extintor es correcto.",
                failureMessage: "Eso no apagará el fuego eléctrico.",
                nextLevelRoute: '/patio',
                optionAssets: [
                  '../images/juegoHannia/botonExtintor.png',
                  '../images/juegoHannia/botonToalla.png', 
                  '../images/juegoHannia/botonCubeta.png',
                ],
              ),
            ),

            // ---------------------------------------------------------
        // RUTA NIVEL 3: PATIO
        // ---------------------------------------------------------
        '/patio': (context) => GameLevelScreen(
              levelData: LevelData(
                id: '3',
                name: 'patio',
                color: const Color.fromARGB(255, 152, 198, 120),
                scenarioImage: 'images/juegoHannia/escena_patio.png', 
                correctOptionAsset: '../images/juegoHannia/botonCubeta.png', 
                successMessage: "¡Excelente! El agua es perfecta para apagar una fogata.",
                failureMessage: "¡Oh, no! ¡Cuidado! intentalo de nuevo con algo seguro",
                nextLevelRoute: '/winner',
                optionAssets: [
                  '../images/juegoHannia/botonSoplar.png',
                  '../images/juegoHannia/botonCubeta.png', 
                  '../images/juegoHannia/botonRamas.png',
                ],
              ),
            ),

    // ---------------------------------------------------------
    // RUTA FINAL: PANTALLA GANADORA
    // ---------------------------------------------------------
    '/winner': (context) => const WinnerScreen(),

      },
    );
  }
}