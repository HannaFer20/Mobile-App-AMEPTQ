import 'package:flutter/material.dart';
import 'level_data.dart';
import 'package:app_project/pages/juegoHannia/app_colors.dart';
import 'package:app_project/pages/juegoHannia/custom_nav_bar.dart';
import 'package:app_project/pages/juegoHannia/option_circle.dart';
import 'package:app_project/pages/juegoHannia/level_banner.dart';
import 'package:app_project/pages/juegoHannia/feedback_screen.dart';

class GameLevelScreen extends StatelessWidget {
  final LevelData levelData;

  const GameLevelScreen({Key? key, required this.levelData}) : super(key: key);

  void _handleOptionSelected(BuildContext context, String selectedAsset) {
    // Verificar si es la opción correcta
    bool isCorrect = (selectedAsset == levelData.correctOptionAsset);

    // Navegar a la pantalla de Resultado (Feedback)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackScreen(
          levelData: levelData,
          isCorrect: isCorrect,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: SafeArea(
        child: Column(
          children: [
            // 1. Banner Superior (Cocina, Sala, etc.)
            LevelBanner(
              label: levelData.name,
              color: levelData.color,
              onBackPressed: () => Navigator.of(context).pop(),
            ),

            // 2. Imagen del Escenario (La niña y el fuego)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Image.asset(
                  levelData.scenarioImage, 
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // 3. Panel Inferior Azul con las Opciones
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
              decoration: const BoxDecoration(
                color: Color(0xFF9AD9EA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: levelData.optionAssets.map((assetPath) {
                      return OptionCircle(
                        child: Image.asset(assetPath),
                        onTap: () => _handleOptionSelected(context, assetPath),
                      );
                    }).toList(),
                  ),
                  
                  const SizedBox(height: 20),

                  // Barra de navegación inferior
                  const CustomNavBar(),
                  
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}