import 'package:flutter/material.dart';

class LevelData {
  final String id;
  final String name; 
  final Color color;
  
  final String scenarioImage; // Imagen de la niña y el fuego
  final String correctOptionAsset; // Cuál imagen es la correcta
  final List<String> optionAssets; // Lista de imágenes para los botones
  
  final String successMessage; // Texto: "¡Bien hecho!..."
  final String failureMessage; // Texto: "¡Oh no!..."
  
  final String nextLevelRoute; 

  LevelData({
    required this.id,
    required this.name,
    required this.color,
    required this.scenarioImage,
    required this.correctOptionAsset,
    required this.optionAssets,
    required this.successMessage,
    required this.failureMessage,
    required this.nextLevelRoute,
  });
}