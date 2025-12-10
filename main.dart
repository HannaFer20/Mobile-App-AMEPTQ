import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: GamePage());
  }
}

class CardItem {
  final String imagePath;
  bool isFlipped;
  bool isMatched;

  CardItem({
    required this.imagePath,
    this.isFlipped = false,
    this.isMatched = false,
  });
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<CardItem> cards = [];
  List<int> flippedIndices = [];
  bool canFlip = true;
  int secondsRemaining = 60;
  Timer? gameTimer;
  bool gameStarted = false;

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  void initializeGame() {
    // Lista de imágenes (2 de cada una para formar pares)
    List<String> images = [
      'img/a.png',
      'img/a.png',
      'img/b.png',
      'img/b.png',
      'img/c.png',
      'img/c.png',
      'img/d.png',
      'img/d.png',
      'img/e.png',
      'img/e.png',
      'img/f.png',
      'img/f.png',
    ];

    // Mezclar las cartas
    images.shuffle(Random());

    // Crear las cartas
    cards = images.map((image) => CardItem(imagePath: image)).toList();

    // Iniciar el temporizador
    startTimer();
  }

  void startTimer() {
    gameStarted = true;
    gameTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          timer.cancel();
          showGameOverDialog(false);
        }
      });
    });
  }

  void onCardTap(int index) {
    if (!canFlip ||
        cards[index].isFlipped ||
        cards[index].isMatched ||
        flippedIndices.length >= 2) {
      return;
    }

    setState(() {
      cards[index].isFlipped = true;
      flippedIndices.add(index);
    });

    if (flippedIndices.length == 2) {
      canFlip = false;
      checkForMatch();
    }
  }

  void checkForMatch() {
    int firstIndex = flippedIndices[0];
    int secondIndex = flippedIndices[1];

    if (cards[firstIndex].imagePath == cards[secondIndex].imagePath) {
      // Es un par!
      setState(() {
        cards[firstIndex].isMatched = true;
        cards[secondIndex].isMatched = true;
      });
      flippedIndices.clear();
      canFlip = true;

      // Verificar si ganó
      if (cards.every((card) => card.isMatched)) {
        gameTimer?.cancel();
        Future.delayed(Duration(milliseconds: 500), () {
          showGameOverDialog(true);
        });
      }
    } else {
      // No es un par, voltear de nuevo después de un delay
      Future.delayed(Duration(milliseconds: 1000), () {
        setState(() {
          cards[firstIndex].isFlipped = false;
          cards[secondIndex].isFlipped = false;
          flippedIndices.clear();
          canFlip = true;
        });
      });
    }
  }

  void showGameOverDialog(bool won) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: won ? Colors.green[400] : Colors.red[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  won ? Icons.emoji_events : Icons.close,
                  size: 80,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                  won ? '¡GANASTE!' : 'GAME OVER',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  won ? '¡Encontraste todos los pares!' : 'Se acabó el tiempo',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetGame();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'JUGAR DE NUEVO',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: won ? Colors.green[700] : Colors.red[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      flippedIndices.clear();
      canFlip = true;
      secondsRemaining = 60;
      gameStarted = false;
    });
    gameTimer?.cancel();
    initializeGame();
  }

  String getFormattedTime() {
    int minutes = secondsRemaining ~/ 60;
    int seconds = secondsRemaining % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xFFE24B43),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        // Acción del botón de retroceso
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xFFE24B43),
                          size: 28,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Memorama',
                      style: TextStyle(
                        fontFamily: 'Fredoka One',
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 55),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Color(0xFFE24B43),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: 0.75,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: screenWidth * 0.025,
                        mainAxisSpacing: screenWidth * 0.025,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => onCardTap(index),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: cards[index].isMatched
                                  ? Colors.green[300]
                                  : Colors.yellow[700],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.orange[800]!,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                  cards[index].isFlipped ||
                                          cards[index].isMatched
                                      ? cards[index].imagePath
                                      : 'img/back.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Tiempo',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 8),
              Text(
                getFormattedTime(),
                style: TextStyle(
                  fontSize: 48,
                  color: secondsRemaining <= 10
                      ? Colors.red[300]
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.08,
                  vertical: 10,
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'img/icon3.png',
                        width: screenWidth * 0.11,
                        height: screenWidth * 0.11,
                      ),
                      Image.asset(
                        'img/icon2.png',
                        width: screenWidth * 0.11,
                        height: screenWidth * 0.11,
                      ),
                      Image.asset(
                        'img/icon1.png',
                        width: screenWidth * 0.11,
                        height: screenWidth * 0.11,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
