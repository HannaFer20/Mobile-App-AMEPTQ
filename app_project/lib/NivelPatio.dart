import 'package:appfuego/pages/NivelSala.dart';
import 'package:flutter/material.dart';

// (Asegúrate de tener el widget BotonInvisible pegado al final 
// de este archivo o en su propio archivo importado)

class PantallaPatio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Para que la imagen cubra todo
        children: <Widget>[
          
          // --- 1. IMAGEN DE FONDO ---
          // Usamos la imagen exacta que nos diste
          Image.asset(
            'imagenes/patioLimpio.jpeg', 
            fit: BoxFit.cover,
          ),

          // --- 2. BOTÓN ATRÁS ---
          Positioned(
            top: screenSize.height * 0.05, // 5% desde arriba
            left: screenSize.width * 0.05, // 5% desde la izquierda
            child: BotonInvisible(
              onTap: () {
                print("Botón Atrás");
                Navigator.pop(context); // Vuelve a la pantalla anterior
              },
              width: screenSize.width * 0.15,
              height: screenSize.height * 0.08,
              // debugColor: Colors.yellow.withOpacity(0.5), // Para depurar
            ),
          ),

          // --- 3. BOTONES DE OPCIONES ---
          // (Aunque ya muestren la respuesta, añadimos
          // el efecto 'splash' para que se sientan interactivos)

          // Botón Extintor (✓)
          Positioned(
            top: screenSize.height * 0.30, // 30% desde arriba
            left: screenSize.width * 0.05,
            child: BotonInvisible(
              onTap: () {
                // Navegar a la pantalla del patio
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NivelSala()),
                );
              },
              width: screenSize.width * 0.25, // Ancho del botón
              height: screenSize.height * 0.1, // Alto del botón
              // debugColor: Colors.green.withOpacity(0.5),
            ),
          ),

          // Botón Agua (✓)
          Positioned(
            top: screenSize.height * 0.42, // 42% desde arriba
            left: screenSize.width * 0.05,
            child: BotonInvisible(
              onTap: () {
                // Navegar a la pantalla del patio
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NivelSala()),
                );
              },
              width: screenSize.width * 0.25,
              height: screenSize.height * 0.1,
              // debugColor: Colors.green.withOpacity(0.5),
            ),
          ),

          // Botón Pala (❌)
          Positioned(
            top: screenSize.height * 0.54, // 54% desde arriba
            left: screenSize.width * 0.05,
            child: BotonInvisible(
              onTap: () {
                print("Tocado Pala (Incorrecto)");
                // Aquí podrías reproducir un sonido de "error"
              },
              width: screenSize.width * 0.25,
              height: screenSize.height * 0.1,
              // debugColor: Colors.red.withOpacity(0.5),
            ),
          ),

          // Botón Ventilador (❌)
          Positioned(
            top: screenSize.height * 0.66, // 66% desde arriba
            left: screenSize.width * 0.05,
            child: BotonInvisible(
              onTap: () {
                print("Tocado Ventilador (Incorrecto)");
              },
              width: screenSize.width * 0.25,
              height: screenSize.height * 0.1,
              // debugColor: Colors.red.withOpacity(0.5),
            ),
          ),

          // --- 4. BOTONES DEL FOOTER (Barra de Navegación) ---
          
          // Botón 1 (Izquierda)
          Positioned(
            bottom: screenSize.height * 0.02,
            left: screenSize.width * 0.1,
            child: BotonInvisible(
              onTap: () => print("Nav 1: Tareas"),
              width: screenSize.width * 0.2, // 20% de ancho
              height: screenSize.height * 0.06, // 6% de alto
              // debugColor: Colors.purple.withOpacity(0.5),
            ),
          ),
          
          // Botón 2 (Centro)
          Positioned(
            bottom: screenSize.height * 0.02,
            // Centrado (50% del ancho de pantalla - la mitad del ancho del botón)
            left: (screenSize.width * 0.5) - (screenSize.width * 0.1), 
            child: BotonInvisible(
              onTap: () => print("Nav 2: Home"),
              width: screenSize.width * 0.2,
              height: screenSize.height * 0.06,
              // debugColor: Colors.purple.withOpacity(0.5),
            ),
          ),

          // Botón 3 (Derecha)
          Positioned(
            bottom: screenSize.height * 0.02,
            right: screenSize.width * 0.1,
            child: BotonInvisible(
              onTap: () => print("Nav 3: Perfil"),
              width: screenSize.width * 0.2,
              height: screenSize.height * 0.06,
              // debugColor: Colors.purple.withOpacity(0.5),
            ),
          ),

        ],
      ),
    );
  }
}

// --- WIDGET REUTILIZABLE (Pégalo abajo en el mismo archivo) ---
// (Este es el mismo que te di antes)
class BotonInvisible extends StatelessWidget {
  final VoidCallback onTap;
  final double width;
  final double height;
  final Color? debugColor; // Color opcional para depuración

  const BotonInvisible({
    Key? key,
    required this.onTap,
    required this.width,
    required this.height,
    this.debugColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell( // InkWell da un efecto "splash" al tocar
      onTap: onTap,
      splashColor: Colors.white.withOpacity(0.3), // Color del "splash"
      borderRadius: BorderRadius.circular(100), // Hace el "splash" redondo
      child: Container(
        width: width,
        height: height,
        // Si 'debugColor' no es nulo, lo usa. Si es nulo, es transparente.
        color: debugColor ?? Colors.transparent,
      ),
    );
  }
}