import 'package:flutter/material.dart';
import 'reading_screen.dart';

class LecturaPatio extends StatelessWidget {
  static const String routeName = 'lectura_patio';

  const LecturaPatio({super.key});

  @override
  Widget build(BuildContext context) {
    return ReadingScreen(
      title: 'Patio',
      headerColor: const Color(0xFF4C98D4), // Azul
      currentRoute: routeName,
      nextRoute: null, // ÚLTIMA PÁGINA: Regresa al menú
      previousRoute: 'lectura_sala', // Anterior: Sala
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '¿Hay riesgos en el patio?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4C98D4)),
          ),
          const SizedBox(height: 10),
          const Text(
            'El patio es un lugar donde hemos sembrado flores y pasto, o donde jugamos. Pero también tiene peligros.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'Sin embargo, también puede haber riesgos de incendio o quemaduras si no se tiene cuidado.',
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
                  'Cuando un calentador de agua está encendido y se echa a perder, puede tener muy poca protección. \n\nSi está mal tapado o si tiene fugas, puede provocar un incendio, explosión o quemadura.',
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
            'También hay productos químicos en el patio. Están cerca de la piscina, como el cloro, o en el garage. ¡No los toques!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Estos productos deben guardarse en lugares frescos, cerrados y lejos del fuego.',
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
                  'Si ves fuego, dale aviso a un adulto de inmediato y aléjate lo más que puedas.',
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