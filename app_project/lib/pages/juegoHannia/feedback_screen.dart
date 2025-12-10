import 'package:flutter/material.dart';
import 'level_data.dart';
import 'package:app_project/pages/juegoHannia/app_colors.dart';
import 'package:app_project/pages/juegoHannia/custom_nav_bar.dart';
import 'package:app_project/pages/juegoHannia/level_buttons.dart';
import 'package:app_project/pages/juegoHannia/level_banner.dart';
import 'package:app_project/pages/juegoHannia/feedback_icons.dart';

class FeedbackScreen extends StatelessWidget {
  final LevelData levelData;
  final bool isCorrect;

  const FeedbackScreen({
    Key? key,
    required this.levelData,
    required this.isCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const Color feedbackBackgroundColor = Color(0xFF009BDD); 

    return Scaffold(
      backgroundColor: feedbackBackgroundColor, 
      body: SafeArea(
        child: Column(
          children: [
            LevelBanner(
              label: levelData.name,
              color: levelData.color,
              onBackPressed: () => Navigator.pop(context),
            ),

            const Spacer(),

            FeedbackIcon(isCorrect: isCorrect),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                isCorrect ? levelData.successMessage : levelData.failureMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  fontFamily: 'VarelaRound',
                ),
              ),
            ),

            const SizedBox(height: 40),

            if (isCorrect)
              ActionButton(
                text: "Continuar",
                color: AppColors.btnGreen,
                onTap: () {
                  if (levelData.nextLevelRoute.isNotEmpty) {
                    Navigator.pushNamed(context, levelData.nextLevelRoute);
                  }
                },
              )
            else
              ActionButton(
                text: "Volver a Intentar",
                color: AppColors.btnRed,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

            const Spacer(),

            Container(
               padding: const EdgeInsets.only(bottom: 20),
               child: const CustomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}