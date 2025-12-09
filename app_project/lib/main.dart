
import 'package:flutter/material.dart';
import 'pages/interfacesHanna/app_title.dart';
import 'pages/interfacesHanna/login.dart';
import 'pages/interfacesHanna/lectura_bano.dart';
import 'pages/interfacesHanna/lectura_cocina.dart';
import 'pages/interfacesHanna/lectura_electrico.dart';
import 'pages/interfacesHanna/lectura_recamara.dart';
import 'pages/interfacesHanna/lectura_patio.dart';
import 'pages/interfacesHanna/lectura_sala.dart';
import 'pages/interfacesDelia/main_menu.dart';
import 'pages/interfacesDelia/terminos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manitas sin Fuego',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto', // Puedes cambiar la fuente si tienes una específica
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AppTitleScreen(),
        '/login': (context) => LoginScreen(),
        '/terminos': (context) => TerminosScreen(),
        '/menu': (context) => MainMenu(),
        LecturaCocina.routeName: (context) => const LecturaCocina(),
        LecturaBano.routeName: (context) => const LecturaBano(),
        LecturaElectrico.routeName: (context) => const LecturaElectrico(),
        LecturaRecamara.routeName: (context) => const LecturaRecamara(),
        LecturaSala.routeName: (context) => const LecturaSala(),
        LecturaPatio.routeName: (context) => const LecturaPatio(),
      },
    );
  }
}