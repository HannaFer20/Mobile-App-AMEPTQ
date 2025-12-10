// lib/pages/kitchen_screen.dart
import 'package:flutter/material.dart';
import '../../components/botones_cocina.dart';
import '../../components/dialogos_cocina.dart';
import 'ganaste.dart';

class KitchenScreen extends StatefulWidget {
  const KitchenScreen({super.key});

  @override
  State<KitchenScreen> createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen> {
  // ---------------------------------------------------
  // LÓGICA DEL JUEGO
  // ---------------------------------------------------

  // Lista de objetos peligrosos que el niño debe encontrar
  // Las claves deben coincidir con los nombres de archivo de tus imágenes de objetos (sin .png)
  final Map<String, bool> _dangerousObjects = {
    'cuchillo': false,
    'limpiador_quimico': false,
    'enchufe_agua': false, // En la imagen, el cable suelto está cerca del agua
    'cerillos': false,
    'sarten_caliente': false, // La sartén en la estufa
  };

  // Nombres de los objetos peligrosos para mostrar en la barra inferior
  final List<String> _objectsToDisplay = [
    'cuchillo',
    'limpiador_quimico',
    'enchufe_agua',
    'cerillos',
    'sarten_caliente',
  ];

  void initState() {
  super.initState();
  // Llama a la función de instrucciones después de que la interfaz se haya construido
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _showInitialInstructions();
  });
}

void _showInitialInstructions() {
  const String instructionsContent = """
¡Hola! ¡Es hora de explorar la cocina! 🔎

TU MISIÓN:
1.  Observa los objetos peligrosos en la barra de abajo (cuchillo, cerillos, etc.).
2.  Busca esos 5 objetos escondidos en la imagen de la cocina. ¡Puedes deslizar la imagen para ver todo!
3.  Cuando encuentres un peligro, tócalo en la imagen (verás un círculo rojo).
4.  Si lo encuentras, el objeto se marcará como encontrado en la barra de abajo.

¡Encuentra los 5 peligros para tener una COCINA SEGURA y ganar el juego!
""";

  _showFeedback(
    title: '¡A Jugar! 👨‍🍳',
    content: instructionsContent,
    color: Colors.blue, 
    icon: Icons.search,
    isDismissible: false, // El niño debe hacer clic en "OK" para empezar
  );
}

  // Función para determinar si el juego ha terminado
  bool get _allFound => !_dangerousObjects.values.contains(false);

  void _handleObjectFound(String objectName) {
    if (_dangerousObjects[objectName] == false) {
      setState(() {
        _dangerousObjects[objectName] = true; // Marca como encontrado
      });

      _showFeedback(
        title: '¡Peligro Encontrado! ⚠️',
        content: '¡Excelente! Encontraste el/la ${objectName.toUpperCase().replaceAll('_', ' ')}. ¡Recuerda no tocarlo!',
        color: Colors.orange,
        icon: Icons.check_circle_outline,
      );
      
      if (_allFound) {
        _navigateToWinScreen();
      }
    }
  }

  void _navigateToWinScreen() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const WinScreen(),
        ),
      );
    });
  }

  void _showFeedback({
    required String title,
    required String content,
    required Color color,
    required IconData icon,
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) => FeedbackDialog(
        title: title,
        content: content,
        color: color,
        icon: icon,
      ),
    );
  }
  
  // ---------------------------------------------------
  // WIDGETS Y UI
  // ---------------------------------------------------

  // Widget de Nube (reutilizado)
  Widget _cloudWidget() {
    return Image.asset(
      'images/cloud.png', 
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    );
  }

  // Widget para un objeto interactivo (el punto de toque)
  Widget _buildHazardPoint({
    required double top, 
    required double left, 
    required String objectName, 
    required double size,
  }) {
    // Si ya fue encontrado, no lo mostramos ni es interactivo
    if (_dangerousObjects[objectName] == true) {
      return Container(); // Widget vacío si ya fue encontrado
    }

    // Usamos el nombre del objeto como ID y lo envolvemos en un GestureDetector
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: () => _handleObjectFound(objectName),
        child: Container(
          width: size,
          height: size,
          // Un círculo visible para indicar dónde tocar
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.4), 
            shape: BoxShape.circle,
            border: Border.all(color: Colors.red, width: 2),
          ),
          child: Center(
            child: Text(
              _objectsToDisplay.indexOf(objectName).toString(), // Número de guía para el niño
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> hazardSpots = [
      {'name': 'cuchillo', 'top': 425.0, 'left': 110.0, 'size': 50.0}, // En la tabla de cortar
      {'name': 'limpiador_quimico', 'top': 350.0, 'left': 128.0, 'size': 60.0}, // Botella verde en el mostrador
      {'name': 'enchufe_agua', 'top': 550.0, 'left': 350.0, 'size': 100.0}, // Cables y agua bajo el fregadero
      {'name': 'cerillos', 'top': 545.0, 'left': 605.0, 'size': 68.0}, // Caja de cerillos en el taburete
      {'name': 'sarten_caliente', 'top': 320.0, 'left': 630.0, 'size': 70.0}, // Sartén humeante en la estufa
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Fondo degradado y nubes
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.teal],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(top: 18, left: 24, child: _cloudWidget()),
          Positioned(top: 32, right: 20, child: _cloudWidget()),
          Positioned(top: 64, left: 140, child: _cloudWidget()),
          Positioned(top: 90, right: 110, child: _cloudWidget()),
          Positioned(top: 120, left: 48, child: _cloudWidget()),
          Positioned(top: 140, right: 36, child: _cloudWidget()),
          Positioned(top: 170, left: 220, child: _cloudWidget()),
          Positioned(top: 195, right: 180, child: _cloudWidget()),
          Positioned(top: 220, left: 12, child: _cloudWidget()),
          Positioned(top: 245, right: 260, child: _cloudWidget()),
          Positioned(top: 270, left: 300, child: _cloudWidget()),
          Positioned(top: 295, right: 40, child: _cloudWidget()),
          Positioned(top: 320, left: 80, child: _cloudWidget()),
          Positioned(top: 350, right: 140, child: _cloudWidget()),
          Positioned(top: 380, left: 180, child: _cloudWidget()),


          // Título y contenedor de la imagen de la cocina
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20), 
                Image.asset(
                  'images/Titulo.png', // Asegúrate de que este título exista o ajústalo
                  height: 100, 
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(height: 12), 
                
                Container(
                  width: 500, // Ajusta al ancho de tu pantalla si es necesario
                  height: 380, // Ajusta a la altura que quieras para la ventana de la cocina
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10, offset: Offset(0, 6), color: Colors.black26,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical, 
                        child: SingleChildScrollView( // Anidamos para scroll horizontal también
                          scrollDirection: Axis.horizontal,
                          child: Stack(
                            children: [
                              // 1. Imagen de Fondo de la Cocina
                              Image.asset(
                                'images/kitchen_background.png',
                                // La imagen generada es de 1024x768. 
                                // Necesitamos que sea más grande que el contenedor (500x380) para el scroll.
                                width: 1024, // Ancho de tu imagen generada
                                height: 768, // Alto de tu imagen generada
                                fit: BoxFit.fill, // Asegura que la imagen ocupe el tamaño especificado
                              ),
                              
                              // 2. Puntos de Peligro Interactivos
                              ...hazardSpots.map((spot) => 
                                _buildHazardPoint(
                                  top: spot['top'],
                                  left: spot['left'], // <--- ¡OJO AQUÍ! Esto parece un error de copy-paste.
                                                     // Debería ser 'left': spot['left'],
                                  objectName: spot['name'],
                                  size: spot['size'],
                                )
                              ).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // --- BARRA DE OBJETOS PELIGROSOS A BUSCAR ---
          Positioned(
            bottom: 60, // Encima de la BottomNavbar
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.white.withOpacity(0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _objectsToDisplay.map((objectName) {
                  final bool isFound = _dangerousObjects[objectName]!;
                  return Opacity(
                    opacity: isFound ? 0.3 : 1.0, // Oscurecer si ya fue encontrado
                    child: Image.asset(
                      'images/$objectName.png', // Usa tus imágenes de objetos individuales
                      width: 50,
                      height: 50,
                      color: isFound ? Colors.grey : null, // Opcional: colorear en gris
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          
          // --- BARRA DE NAVEGACIÓN INFERIOR ---
          const BottomNavbar(), 
        ],
      ),
    );
  }
}