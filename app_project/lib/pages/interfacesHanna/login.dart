import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo de cielo y césped (Mismo diseño que AppTitleScreen)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF87CEEB), 
                  Color(0xFFB0E0E6), 
                  Color(0xFF80C080), 
                ],
                stops: [0.0, 0.75, 1.0],
              ),
            ),
          ),

          // Colinas de Césped (Mismo diseño que AppTitleScreen)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.25,
              decoration: const BoxDecoration(
                color: Color(0xFF55AE55), 
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
                    // Título o instrucción amigable
                    const Text(
                      '¡Hola! ¿Cuál es tu nombre?',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE44A29), // Rojo vibrante
                        shadows: [Shadow(blurRadius: 1, color: Colors.black38, offset: Offset(1, 1))]
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),

                    // CAMPO DE TEXTO MEJORADO (Estilo de "Nube" o Cartel)
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white, // Fondo blanco para escribir
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 4,
                          color: const Color(0xFF87CEEB), // Borde azul claro
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Escribe aquí tu nombre',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333)
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),

                    // BOTÓN JUGAR (Manteniendo el estilo pop-out amarillo)
                    ElevatedButton(
                      onPressed: () {
                        final name = _nameController.text.trim().isEmpty ? 'Niño' : _nameController.text.trim();
                        // Asumo que la ruta debe recibir el argumento del nombre
                        Navigator.pushNamed(
                          context, 
                          '/terminos/',
                          arguments: name
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF0C419), // Amarillo brillante
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(color: Color(0xFFC0702D), width: 6),
                        ),
                        elevation: 15,
                      ),
                      child: const Text(
                        '¡VAMOS!', // Texto más directo
                        style: TextStyle(
                          fontSize: 32,
                          color: Color(0xFFE44A29),
                          fontWeight: FontWeight.w900,
                           shadows: [
                            Shadow(
                              blurRadius: 2.0, 
                              color: Colors.black38, 
                              offset: Offset(2, 2)
                            )
                          ]
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