import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Media Query para obtener el tamaño de la pantalla
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // Se reutiliza el fondo de la pantalla anterior para mantener la consistencia
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

          // Contenido principal: Logo, Input y Botón
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // LOGO SUPERIOR (Placeholder Image.asset vacío)
                    Container(
                      width: 300,
                      height: 250,
                      margin: const EdgeInsets.only(bottom: 60),
                      // **Placeholder del Logo**
                      child: Image.asset('images/lecturaHanna/logo.png'), // Asume que tienes esta carpeta
                    ),

                    // ETIQUETA "Nombre del niño"
                    const Text(
                      'Nombre del niño',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // CAMPO DE TEXTO
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Nombre',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // BOTÓN JUGAR
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/terminos');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Fondo del botón rojo
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 10,
                      ),
                      child: const Text(
                        'JUGAR',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}