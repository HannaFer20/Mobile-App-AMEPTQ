import 'package:flutter/material.dart';
import 'dart:math';
import '../../components/bear_display.dart';
import '../../components/bottom_navbar.dart';
import '../../components/object_selector.dart';
import '../../components/feedback_dialog.dart';
import 'win_screen.dart';

class BearCareScreen extends StatefulWidget {
  const BearCareScreen({super.key});

  @override
  State<BearCareScreen> createState() => _BearCareScreenState();
}

class _BearCareScreenState extends State<BearCareScreen> {

  List<String> _availableObjects = [
    'agua',
    'curita',
    'pomada',
    'gasa',
    'jeringa',
    'telefono',
    'hielo',
    'alcohol',
    'mantequilla',
    'pastadental',
    'aceite',
    'vendaje',
    'crema_quemaduras',
    'analgesico',
    'guantes',
  ];

  final List<String> _essentialCorrectObjects = [
    'agua',
    'gasa',
    'vendaje',
    'crema_quemaduras',
    'analgesico',
    'guantes',
  ];

  List<String> _appliedEssentialObjects = [];

  final List<String> _optionalCorrectObjects = ['suero', 'pinzas'];


  @override
  void initState() {
    super.initState();
    _availableObjects.shuffle(Random());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showInitialInstructions();
    });
  }

  void _showInitialInstructions() {
    const String instructionsContent = """
¡Hola! El osito se quemó una patita 🐾 y necesita tu ayuda.

TU MISIÓN:
1.  Busca los objetos correctos en el carrusel de abajo.
2.  Arrastra cada objeto que creas que cura al oso (¡Necesitas varios!).
3.  Si es bueno, el objeto desaparecerá y verás una .
4.  Si es malo, verás una  y el objeto volverá a su lugar.

¡Aplica todos los pasos esenciales para curar al oso y ganar!
""";

    _showFeedbackDialog(
      title: '¡Primeros Auxilios! 🩹',
      content: instructionsContent,
      color: Colors.blue,
      icon: Icons.assignment,
      isDismissible: false, 
    );
  }

  

  bool _isBadObject(String name) {
    const badObjects = [
      'curita',
      'jeringa',
      'telefono',
      'hielo',
      'alcohol',
      'pomada',
      'mantequilla',
      'pastadental',
      'aceite',
    ];
    return badObjects.contains(name);
  }

  void _handleDrop(String selectedObjectName) {

    if (_isBadObject(selectedObjectName)) {
      _showErrorFeedback(selectedObjectName);
      return;
    }

    if (_essentialCorrectObjects.contains(selectedObjectName)) {
      if (!_appliedEssentialObjects.contains(selectedObjectName)) {
        setState(() {
          _appliedEssentialObjects.add(selectedObjectName);
          _availableObjects.remove(selectedObjectName);
        });

        _showFeedbackDialog(
          title: '¡PERFECTO! ✅',
          content:
              '¡Muy bien! El ${selectedObjectName.toUpperCase()} es un Objeto Esencial para curar la quemadura del oso.',
          color: Colors.green,
          icon: Icons.check_circle,
        );

        if (_appliedEssentialObjects.length ==
            _essentialCorrectObjects.length) {
          _navigateToWinScreen();
        }
      }
      return;
    }

    if (_optionalCorrectObjects.contains(selectedObjectName)) {
      setState(() {
        _availableObjects.remove(selectedObjectName);
      });

      _showFeedbackDialog(
        title: '¡Buena idea! 👍',
        content:
            'El ${selectedObjectName.toUpperCase()} también es muy útil en primeros auxilios. Es un buen cuidado extra.',
        color: Colors.lightGreen,
        icon: Icons.thumb_up,
      );
      return;
    }
  }


  void _navigateToWinScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WinScreen()),
      );
    });
  }

  void _showErrorFeedback(String selectedObjectName) {
    String title = '¡ALTO!';
    String errorContent = '';

    if (['mantequilla', 'pastadental', 'aceite'].contains(selectedObjectName)) {
      errorContent =
          '¡Advertencia! Nunca uses ${selectedObjectName.toUpperCase()} en una quemadura. Los remedios caseros pueden atrapar el calor y causar una infección. ¡Solo AGUA es seguro al inicio!';
    } else if (selectedObjectName == 'alcohol') {
      errorContent =
          '¡El alcohol QUEMA! Nunca lo uses en una quemadura. Causará mucho dolor y daño. ¡Busca el AGUA!';
    } else if (selectedObjectName == 'hielo') {
      errorContent =
          'El hielo directo puede dañar la piel. Es mejor usar agua fresca o un paño húmedo y frío. ¡Busca el agua!';
    } else if (selectedObjectName == 'pomada') {
      errorContent =
          'La pomada solo se aplica después de haber enfriado y limpiado la quemadura. No es el primer paso.';
    } else {
      errorContent =
          'El ${selectedObjectName.toUpperCase()} no es el objeto adecuado para curar la quemadura.';
    }

    _showFeedbackDialog(
      title: title,
      content: errorContent,
      color: Colors.red,
      icon: Icons.close,
    );
  }

  void _showFeedbackDialog({
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

  bool get _isBearCured =>
      _appliedEssentialObjects.length == _essentialCorrectObjects.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo degradado
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.teal],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'images/Titulo_oso.png',
                  height: 100,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(height: 1),

                // DRAG TARGET
                DragTarget<String>(
                  builder: (context, candidateData, rejectedData) {
                    return BearDisplay(isCured: _isBearCured);
                  },
                  onWillAcceptWithDetails: (details) => true,
                  onAccept: (data) {
                    _handleDrop(data);
                  },
                ),
              ],
            ),
          ),

          ObjectSelector(availableObjects: _availableObjects),

          const BottomNavbar(),
        ],
      ),
    );
  }
}
