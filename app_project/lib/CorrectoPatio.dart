import 'package:appfuego/pages/NivelSala.dart';
import 'package:flutter/material.dart';
import 'NivelCocina.dart';
// ¡Ya no necesitamos 'boton_invisible.dart' en ESTE archivo!

class Decisiones extends StatelessWidget {
  const Decisiones({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // --- 1. FONDO ---
          Image.asset(
            'imagenes/CorrectoPatio.jpeg', // Fondo sin el botón "Jugar"
            fit: BoxFit.cover,
          ),

          // --- 2. BOTÓN INVISIBLE (Sobre la niña) ---
          // Este lo dejamos invisible, como un "easter egg"
          Positioned(
            top: screenSize.height * 0.1,
            left: screenSize.width * 0.1,
            right: screenSize.width * 0.1,
            bottom: screenSize.height * 0.2,
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Has encontrado un huevo de pascua!'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.orange,
                  ),
                );
              },
              child: Container(
                color: Colors.transparent, // Sigue siendo invisible
              ),
            ),
          ),
          
          // --- 3. BOTÓN "JUGAR" (VISIBLE) ---
          Positioned(
            bottom: screenSize.height * 0.09, // Lo subí un poco (antes 0.08)
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NivelSala()),
                    );
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 15, 126, 32), 
                  foregroundColor: Colors.white, 
                  minimumSize: Size(screenSize.width * 0.5, 50), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'CONTINUAR',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),

          // --- 4. BOTONES DEL FOOTER (¡AHORA VISIBLES!) ---
          // ¡Aquí está el cambio!
          
          // Botón 1 (Izquierda - Tareas)
          Positioned(
            bottom: screenSize.height * 0.01, // 1% desde abajo
            left: screenSize.width * 0.1, // 10% desde la izquierda
            child: IconButton(
              icon: Icon(Icons.list_alt), // Icono de "Tareas"
              iconSize: 40.0, // Tamaño del icono
              color: Colors.white, // Color del icono
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tareas próximamente'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
            ),
          ),
          
          // Botón 2 (Centro - Home)
          Positioned(
            bottom: screenSize.height * 0.01,
            // Centrado: 50% del ancho MENOS la mitad del tamaño del icono (20)
            left: (screenSize.width * 0.5) - 20, 
            child: IconButton(
              icon: Icon(Icons.home), // Icono de "Home"
              iconSize: 40.0,
              color: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Estás en el inicio'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ),

          // Botón 3 (Derecha - Perfil)
          Positioned(
            bottom: screenSize.height * 0.01,
            right: screenSize.width * 0.1, // 10% desde la derecha
            child: IconButton(
              icon: Icon(Icons.person), // Icono de "Perfil"
              iconSize: 40.0,
              color: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Perfil próximamente'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.purple,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}