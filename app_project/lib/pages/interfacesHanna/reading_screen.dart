import 'package:flutter/material.dart';

class ReadingScreen extends StatelessWidget {
  final String title;
  final Color headerColor;
  final Widget content;
  final String? backgroundImagePath;
  final String currentRoute;
  final String? nextRoute;
  final String? previousRoute;

  const ReadingScreen({
    super.key,
    required this.title,
    required this.headerColor,
    required this.content,
    required this.currentRoute,
    this.backgroundImagePath,
    this.nextRoute,
    this.previousRoute,
  });

  @override
  Widget build(BuildContext context) {
    // Media Query para obtener el tamaño de la pantalla
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          if (backgroundImagePath != null)
            Positioned.fill(
              child: Image.asset(
                backgroundImagePath!,
                fit: BoxFit.cover,
              ),
            ),
          
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.25,
              decoration: const BoxDecoration(
                color: Color(0xFF90EE90), // Verde césped
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(500),
                  topRight: Radius.circular(500),
                ),
              ),
            ),
          ),

          // 2. Cabecera Fija (Color y Título)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.2,
              color: headerColor,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Botón para regresar (flecha hacia la izquierda)
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                        onPressed: () {
                          // Navega a la ruta anterior o simplemente regresa si no hay ruta anterior definida
                          if (previousRoute != null) {
                            Navigator.pushReplacementNamed(context, previousRoute!);
                          } else {
                            // Si es la primera, puede regresar a la ruta principal o al menú
                            Navigator.pop(context);
                          }
                        },
                      ),
                      // Título
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Icono o espacio para centrar el título
                      const SizedBox(width: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 3. Contenido (Texto e Imágenes)
          Positioned(
            top: screenHeight * 0.15, // Empieza debajo de la cabecera
            left: 20,
            right: 20,
            bottom: 80, // Espacio para la barra de navegación inferior
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: content,
              ),
            ),
          ),

          // 4. Barra de Navegación Inferior (Flechas)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              color: Colors.transparent, // Transparente para ver el fondo
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5),
                      ],
                    ),
                    child: previousRoute == null
                        ? const Center(child: Icon(Icons.close, color: Colors.white))
                        : IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                            onPressed: () {
                              if (previousRoute != null) {
                                Navigator.pushReplacementNamed(context, previousRoute!);
                              }
                            },
                          ),
                  ),
                  
                  // Flecha Derecha (Siguiente)
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: nextRoute == null ? Colors.blue : Colors.red, // Azul para el final
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5),
                      ],
                    ),
                    child: nextRoute == null
                        ? IconButton(
                            // Última página: Regresar a la ruta principal/menú
                            icon: const Icon(Icons.home, color: Colors.white),
                            onPressed: () {
                              Navigator.pushNamed(context, '/menu');
                            },
                          )
                        : IconButton(
                            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, nextRoute!);
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}