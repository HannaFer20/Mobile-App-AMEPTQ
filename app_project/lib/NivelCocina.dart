import 'package:flutter/material.dart';
import '../widgets/boton_invisible.dart' as botonInvisible; // Cambiado
import 'package:appfuego/pages/NivelPatio.dart'; // Cambiado

class NivelCocina extends StatelessWidget {
  // Usamos el constructor moderno ({super.key})
  const NivelCocina({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // --- 1. IMAGEN DE FONDO ---
          Image.asset(
            'imagenes/CocinaLimpia.jpeg', // (Recuerda borrar el "Atrás" y el footer)
            fit: BoxFit.cover,
          ),

          // --- 2. BOTÓN ATRÁS (VISIBLE) ---
          Positioned(
            top: screenSize.height * 0.04,
            left: screenSize.width * 0.04,
            child: IconButton( // ¡Botón visible!
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.white,
              iconSize: 40.0,
              onPressed: () {
                print("Atrás");
                Navigator.pop(context);
              },
            ),
          ),

          // --- 3. BOTONES DE OPCIONES (INVISIBLES) ---
          // (Estos usan tu widget BotonInvisible)
          Positioned(
            top: screenSize.height * 0.38,
            left: screenSize.width * 0.05,
            child: botonInvisible.BotonInvisible(
              onTap: () => print("Tocado Agua (Incorrecto)"),
              width: screenSize.width * 0.25,
              height: screenSize.height * 0.12,
              // debugColor: Colors.red.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.52,
            left: screenSize.width * 0.05,
            child: BotonInvisible(
              onTap: () {
                // Navegar a la pantalla del patio
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaPatio()),
                );
              },
              width: screenSize.width * 0.25,
              height: screenSize.height * 0.12,
              // debugColor: Colors.green.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.30,
            right: screenSize.width * 0.05,
            child: BotonInvisible(
              onTap: () => print("Tocado Abanico (Incorrecto)"),
              width: screenSize.width * 0.25,
              height: screenSize.height * 0.12,
              // debugColor: Colors.red.withOpacity(0.5),
            ),
          ),

          // --- 4. BOTÓN DEL POP-UP "¡BIEN HECHO!" (INVISIBLE) ---
          Positioned(
            bottom: screenSize.height * 0.15, 
            left: screenSize.width * 0.1,
            right: screenSize.width * 0.1,
            child: BotonInvisible(
              onTap: () {
                // Navegar a la pantalla del patio
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaPatio()),
                );
              },
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.3,
              // debugColor: Colors.blue.withOpacity(0.4),
            ),
          ),

          // --- 5. BOTONES DEL FOOTER (VISIBLES) ---
          Positioned(
            bottom: screenSize.height * 0.01,
            left: screenSize.width * 0.1,
            child: IconButton(
              icon: Icon(Icons.list_alt),
              iconSize: 40.0,
              color: Colors.white,
              onPressed: () => print("Nav 1 (Tareas)"),
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.01,
            left: (screenSize.width * 0.5) - 20, // Centrado
            child: IconButton(
              icon: Icon(Icons.home),
              iconSize: 40.0,
              color: Colors.white,
              onPressed: () => print("Nav 2 (Home)"),
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.01,
            right: screenSize.width * 0.1,
            child: IconButton(
              icon: Icon(Icons.person),
              iconSize: 40.0,
              color: Colors.white,
              onPressed: () => print("Nav 3 (Perfil)"),
            ),
          ),
        ],
      ),
    );
  }
}