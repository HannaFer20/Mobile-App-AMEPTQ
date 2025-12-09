import 'package:flutter/material.dart';
import 'reading_screen.dart';

class LecturaRecamara extends StatelessWidget {
  static const String routeName = 'lectura_recamara';

  const LecturaRecamara({super.key});

  @override
  Widget build(BuildContext context) {
    return ReadingScreen(
      title: 'Recámara',
      headerColor: const Color(0xFFE44A29), // Rojo
      currentRoute: routeName,
      nextRoute: 'lectura_sala', // Siguiente: Sala
      previousRoute: 'lectura_electrico', // Anterior: Eléctrico
      backgroundImagePath: 'images/lecturaHanna/fondoRecamara.png',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '¿Hay riesgos en la recámara?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFE44A29)),
          ),
          const SizedBox(height: 10),
          const Text(
            'Si ponemos demasiado cerca del calor, o si jalamos los cables o tiramos las cosas, podemos lastimarnos.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'No es seguro dejar cargando el celular toda la noche, o mientras duermo, porque la batería puede calentarse y causar fuego.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Imagen Placeholder
              Expanded(
                flex: 2,
                child: Image.asset('images/lecturaHanna/imagenRecamara.png'),
              ),
              const SizedBox(width: 10),
              // Columna de Texto
              const Expanded(
                flex: 3,
                child: Text(
                  'Tampoco debemos tener velas encendidas o lámparas que puedan tirarse y encender las cortinas o el colchón.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Evita tener muchos cables conectados al mismo enchufe.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Mantén tu recámara ordenada, sin cosas que tapen los pasillos o que estén tiradas. Después de usarlas, guárdalas en su sitio.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'Además, mantén tu cuarto limpio y ordenado.',
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
                  'Antes de dormir, revisa que no esté conectado a la luz ningún aparato eléctrico.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(width: 10),
              // Imagen Placeholder
              Expanded(
                flex: 2,
                child: Image.asset('images/lecturaHanna/imagenRecamaraPeligro.png'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Al desconectarlo, tira suavemente del enchufe y no del cable. No lo jales.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}