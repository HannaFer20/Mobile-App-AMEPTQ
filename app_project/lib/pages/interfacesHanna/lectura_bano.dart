import 'package:flutter/material.dart';
import 'reading_screen.dart';

class LecturaBano extends StatelessWidget {
  static const String routeName = 'lectura_bano';

  const LecturaBano({super.key});

  @override
  Widget build(BuildContext context) {
    return ReadingScreen(
      title: 'Baño',
      headerColor: const Color(0xFF4C98D4), // Azul
      currentRoute: routeName,
      nextRoute: 'lectura_electrico', // Siguiente: Eléctrico
      previousRoute: 'lectura_cocina', // Anterior: Cocina
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '¿Hay riesgos en el baño?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4C98D4)),
          ),
          const SizedBox(height: 10),
          const Text(
            'El baño parece ser un lugar tranquilo, pero también puede tener riesgos si no tienes cuidado.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'Uno de los peligros más comunes es el agua caliente. Si abrimos la llave equivocada o abrimos la misma, podemos quemarnos.',
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
                  'Antes de meterte a la tina o la regadera, pídele a un adulto que te revise la temperatura del agua con el codo o la muñeca.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'También hay productos que parecen inofensivos, pero pueden ser muy peligrosos.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Algunos suelen tener tapas o colores llamativos, pero nunca debes tocarlos, quizás pueden ser venenos.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'Si es así, simplemente déjalos.',
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
                  'Recuerda que el piso del baño está cubierto de baldosas o vinilo resbaladizo. \nPara evitar accidentes, camina despacio y utiliza con cuidado las toallas y las alfombras para evitar resbalar.',
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
        ],
      ),
    );
  }
}