import 'package:flutter/material.dart';

class AppTitleScreen extends StatelessWidget {
  const AppTitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Media Query para obtener el tamaño de la pantalla
    final screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo de cielo y césped
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF87CEEB), // Azul cielo claro
                  Color(0xFFFFFFFF), // Blanco intermedio
                  Color(0xFF90EE90), // Verde césped claro
                ],
                stops: [0.0, 0.75, 1.0],
              ),
            ),
          ),

          // Nubes y colinas (Placeholder simple)
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
          
          // FORMA CURVA ROJA SUPERIOR (Usando ClipPath)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: _AppTitleClipper(),
              child: Container(
                height: screenHeight * 0.45, // Ajusta la altura según necesites
                color: Colors.red,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100.0), // Mueve el texto hacia arriba
                    child: Text(
                      'Manitas sin\nfuego',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // LOGO CENTRAL (Placeholder Image.asset vacío)
          Positioned(
            top: screenHeight * 0.35, // Posición que se superpone a la forma roja
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 300,
                height: 200,
                // **Placeholder del Logo**
                child: Image.asset('images/lecturaHanna/logo.png',), // Asume que tienes esta carpeta
              ),
            ),
          ),

          // BOTÓN INICIAR
          Positioned(
            bottom: screenHeight * 0.1,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navegación a la pantalla de login
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Fondo del botón rojo
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 10,
                ),
                child: const Text(
                  'INICIAR',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// CLASE PARA DEFINIR LA FORMA CURVA ROJA
class _AppTitleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.7); // Empieza en la parte superior izquierda y baja
    
    // Curva que define el fondo redondeado
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 3 / 4, size.height);
    var secondEndPoint = Offset(size.width, size.height * 0.7);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0); // Sube a la parte superior derecha
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}