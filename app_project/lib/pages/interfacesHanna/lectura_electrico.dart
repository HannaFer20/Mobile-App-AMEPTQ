import 'package:flutter/material.dart';
import 'reading_screen.dart';

class LecturaElectrico extends StatelessWidget {
  static const String routeName = 'lectura_electrico';

  const LecturaElectrico({super.key});

  @override
  Widget build(BuildContext context) {
    return ReadingScreen(
      title: 'Área eléctrica',
      headerColor: const Color(0xFFC0702D), // Naranja Oscuro
      currentRoute: routeName,
      nextRoute: 'lectura_recamara', // Siguiente: Recámara
      previousRoute: 'lectura_bano', // Anterior: Baño
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '¿Hay riesgos con la energía?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFC0702D)),
          ),
          const SizedBox(height: 10),
          const Text(
            'La electricidad nos ayuda a tener luz, ver televisión o a cargar nuestras tabletas o celular, pero también puede ser peligrosa si no la usamos correctamente.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'La corriente no se ve, pero sí quema.',
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
                  'Un enchufe puede parecer inofensivo, pero si se toca con los dedos o se introduce cualquier objeto por el cuerpo, puede causar una quemadura eléctrica.',
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
            'Nunca debemos meter los dedos o lápices en los enchufes, ni jugar con los cables.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Tampoco es bueno tocar cables quemados o pelados, ya que pueden hacer que la corriente toque tus manos o dedos.',
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
                  'Si ves un cable dañado, no lo toques.\n\nSiempre, pide a un adulto que te ayude con cualquier cable o aparato eléctrico.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Cuando estés en el baño o cerca del agua, no uses ningún aparato eléctrico, como secadores, radios o cargadores. ¡El agua y la electricidad no son buenos amigos!.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}