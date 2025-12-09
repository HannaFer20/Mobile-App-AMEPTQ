import 'package:flutter/material.dart';
import 'reading_screen.dart';

class LecturaCocina extends StatelessWidget {
  static const String routeName = 'lectura_cocina';

  const LecturaCocina({super.key});

  @override
  Widget build(BuildContext context) {
    return ReadingScreen(
      title: 'Cocina',
      headerColor: const Color(0xFFE44A29),
      currentRoute: routeName,
      nextRoute: 'lectura_bano', // Siguiente: Baño
      previousRoute: null, // Primera página
      backgroundImagePath: 'images/lecturaHanna/fondoCocina.png',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '¿Hay riesgos en la cocina?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFE44A29)),
          ),
          const SizedBox(height: 10),
          const Text(
            'Sí, aunque parezca increíble de creer.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'La cocina es un lugar donde se preparan cosas deliciosas, pero también donde pasan cosas peligrosas.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Columna de Texto
              const Expanded(
                flex: 3,
                child: Text(
                  'Cuando mamá o papá cocinan, usan cosas que pueden quemar, como el fuego de la estufa, o el horno que está tan caliente que saca un olor distinto. Si alguien usa estas cosas sin protección, puede salir lastimado muy seriamente.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(width: 10),
              // Imagen Placeholder
              Expanded(
                flex: 2,
                child: Image.asset('images/lecturaHanna/imagenEstufaPeligro.png'),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Por eso, nunca debemos jugar en la cocina, sobre todo cuando un adulto está cocinando.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Es importante mantener esta distancia de seguro y no tocar ni acercarse a nada del fuego.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Columna de Texto
              const Expanded(
                flex: 3,
                child: Text(
                  'Cuando te sientas cómodo o juegues en la cocina, es importante que no toques líquidos calientes, porque pueden estar muy calientes.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(width: 10),
              // Imagen Placeholder
              Expanded(
                flex: 2,
                child: Image.asset('images/lecturaHanna/imagenSustancias.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}