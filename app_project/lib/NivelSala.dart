import 'package:flutter/material.dart';
import 'NivelPatio.dart';
import 'Trofeo.dart';
import '../widgets/boton_invisible.dart' as botonInvisible; // Cambiado

class NivelSala extends StatelessWidget {
  const NivelSala({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // 1. Fondo
          Image.asset(
            'imagenes/SalaLimpia.jpeg',
            fit: BoxFit.cover,
          ),

          // 2. Botón atrás (visible)
          Positioned(
            top: screenSize.height * 0.04,
            left: screenSize.width * 0.04,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: const Color.fromARGB(0, 255, 255, 255),
              iconSize: 40.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaPatio()),
                );
              },
            ),
          ),

          // 3. Botones invisibles (opciones)
          Positioned(
            top: screenSize.height * 0.28,
            left: screenSize.width * 0.08,
            child: BotonInvisible(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Trofeo()),
                );
              },
              width: screenSize.width * 0.22,
              height: screenSize.height * 0.1,
            ),
          ),
          Positioned(
            top: screenSize.height * 0.40,
            left: screenSize.width * 0.08,
            child: BotonInvisible(
              onTap: () => debugPrint('Tocado Agua (Invisible)'),
              width: screenSize.width * 0.22,
              height: screenSize.height * 0.1,
            ),
          ),
          Positioned(
            top: screenSize.height * 0.52,
            left: screenSize.width * 0.08,
            child: BotonInvisible(
              onTap: () => debugPrint('Tocado Trapo (Invisible)'),
              width: screenSize.width * 0.22,
              height: screenSize.height * 0.1,
            ),
          ),
          Positioned(
            top: screenSize.height * 0.64,
            left: screenSize.width * 0.08,
            child: BotonInvisible(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Trofeo()),
                );
              },
              width: screenSize.width * 0.22,
              height: screenSize.height * 0.1,
            ),
          ),

          // 4. Botón del popup (invisible)
          Positioned(
            bottom: screenSize.height * 0.15,
            left: screenSize.width * 0.1,
            right: screenSize.width * 0.1,
            child: BotonInvisible(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Trofeo()),
                );
              },
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.3,
            ),
          ),

          // 5. Footer (visibles)
          Positioned(
            bottom: screenSize.height * 0.01,
            left: screenSize.width * 0.1,
            child: IconButton(
              icon: const Icon(Icons.list_alt),
              iconSize: 40.0,
              color: Colors.white,
              onPressed: () => debugPrint('Nav 1 (Tareas)'),
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.01,
            left: (screenSize.width * 0.5) - 20,
            child: IconButton(
              icon: const Icon(Icons.home),
              iconSize: 40.0,
              color: Colors.white,
              onPressed: () => debugPrint('Nav 2 (Home)'),
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.01,
            right: screenSize.width * 0.1,
            child: IconButton(
              icon: const Icon(Icons.person),
              iconSize: 40.0,
              color: Colors.white,
              onPressed: () => debugPrint('Nav 3 (Perfil)'),
            ),
          ),
        ],
      ),
    );
  }
}