
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
import 'pages/interfacesDaniela/settings_base.dart';

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
        TerminosScreen.routeName: (context) {
          // El nombre viene desde Login
          final args = ModalRoute.of(context)?.settings.arguments as String? ?? 'Niño';
          return TerminosScreen(childName: args);
        },
        MainMenu.routeName: (context) {
          final args = ModalRoute.of(context)?.settings.arguments as String? ?? 'Niño';
          return MainMenu(childName: args);
        },
        SettingsBase.routeName: (context) {
          final args = ModalRoute.of(context)?.settings.arguments as String? ?? 'Niño';
          return SettingsBase(childName: args);
        },
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