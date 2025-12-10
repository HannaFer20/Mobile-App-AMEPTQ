import 'package:flutter/material.dart';
import 'package:app_project/pages/juegoHannia/Nivel_1/nivel_1_Cocina.dart';
import 'package:app_project/pages/juegoHannia/Nivel_1/cocina_incorrecto.dart';
import 'package:app_project/pages/juegoHannia/Nivel_1/cocina_correcto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seguridad en la Cocina',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Definimos la pantalla inicial
      initialRoute: '/',
      // Definimos las rutas para navegar entre pantallas
      routes: {
        '/': (context) => const MainScreen(),
        '/success': (context) => const SuccessScreen(),
        '/error': (context) => const ErrorScreen(),
      },
      // Ocultamos la etiqueta de debug
      debugShowCheckedModeBanner: false,
    );
  }
}