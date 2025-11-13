import 'package:flutter/material.dart';

class TerminosScreen extends StatelessWidget {
  const TerminosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/imgTerminos.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/logoBomberos.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'MANITAS SIN FUEGO',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'TÉRMINOS Y CONDICIONES DE USO',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '1. Aceptación de los términos:\n'
                          'Al descargar, acceder o utilizar esta aplicación, usted (el padre, madre o tutor legal del menor) acepta los presentes Términos y Condiciones. '
                          'Si no está de acuerdo con alguno de los puntos aquí establecidos, le pedimos que no permita que el menor utilice la aplicación.\n\n'
                          '2. Uso bajo supervisión adulta:\n'
                          'Esta aplicación está diseñada para ser utilizada por niños con la supervisión y consentimiento de un adulto responsable. '
                          'El adulto es el encargado de leer y explicar el contenido al niño y de vigilar su interacción con los juegos o materiales de la app.\n\n'
                          '3. Propósito educativo:\n'
                          'Manitas sin fuego no se hace responsable del mal uso que se haga del contenido de la aplicación fuera de su contexto educativo. '
                          'Cualquier práctica con o cerca de fuego debe realizarse únicamente bajo la guía de un adulto y en condiciones seguras.\n\n'
                          '4. Recordatorio importante para padres o tutores:\n'
                          'Esta aplicación no reemplaza la enseñanza directa ni la supervisión adulta. Su propósito es reforzar hábitos de seguridad y prevención del fuego '
                          'mediante el juego y el aprendizaje interactivo.\n',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 30),

                        // Botón de aceptar
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 4,
                            ),
                            onPressed: () {
                              // 👇 Aquí puedes regresar a la pantalla anterior
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'ACEPTO LOS TÉRMINOS Y CONDICIONES',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
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
        ),
      ),
    );
  }
}
