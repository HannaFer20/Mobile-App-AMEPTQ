import 'package:flutter/material.dart';
import 'reading_screen.dart';

class LecturaSala extends StatelessWidget {
  static const String routeName = 'lectura_sala';

  const LecturaSala({super.key});

  @override
  Widget build(BuildContext context) {
    return ReadingScreen(
      title: 'Sala',
      headerColor: const Color(0xFFC0702D), // Naranja Oscuro
      currentRoute: routeName,
      nextRoute: 'lectura_patio', // Siguiente: Patio
      previousRoute: 'lectura_recamara', // Anterior: Recámara
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '¿Hay riesgos en la sala?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFC0702D)),
          ),
          const SizedBox(height: 10),
          const Text(
            'La sala es donde la familia se reúne para ver películas, jugar o descansar. Pero también puede esconder algunos peligros.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'A veces los cables sueltos o enchufes sin protección, a todo esto puedes causar accidentes.',
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
                  'También es importante no correr o jugar cerca de aparatos electrónicos, como la televisión o las lámparas, porque podrías tropezar con los cables o el mueble.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(width: 10),
              // Imagen Placeholder
              Expanded(
                flex: 2,
                child: Image.asset(''),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Debes tener mucho cuidado en dónde pisas.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Cuando termines de usar tus aparatos, apágalos y desconéctalos, así evitas que se calienten o se quemen.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            '¡Sé muy cuidadoso con tus dispositivos!',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Imagen Placeholder
              Expanded(
                flex: 2,
                child: Image.asset(''),
              ),
              const SizedBox(width: 10),
              // Columna de Texto
              const Expanded(
                flex: 3,
                child: Text(
                  'No deben quedar cerca de la calefacción o las estufas. \n\nNo debes distraerte mientras están en operación y pídeles a tus papás que los tapen o les pongan formas de proteger a la familia.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}