import 'package:flutter/material.dart';
import 'bear_care_screen.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.lightGreenAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 150, color: Colors.yellow),
              const SizedBox(height: 20),
              const Text(
                '¡GANASTE!',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black38,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '¡Curaste al osito correctamente!',
                style: TextStyle(fontSize: 24, color: Colors.white70),
              ),
              const SizedBox(height: 50),
              // Botón para volver al inicio o reiniciar
              ElevatedButton.icon(
                onPressed: () {
                  // Vuelve a la primera pantalla de la pila (MyApp -> BearCareScreen)
                  var pushReplacement = Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const BearCareScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.refresh),
                label: const Text(
                  'Volver a Jugar',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
