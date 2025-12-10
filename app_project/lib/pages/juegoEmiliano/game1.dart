import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  int _spriteIndex = 1;
  bool _isJumping = false;
  Timer? _walkingTimer;
  Timer? _obstacleTimer;
  List<Obstacle> _obstacles = [];
  int _score = 0;
  Timer? _scoreTimer;
  double _gameSpeed = 4.0;
  bool _gameOver = false;
  late AnimationController _titleAnimationController;
  late Animation<double> _titleAnimation;
  bool _isDayTime = true;
  int _points = 0;

  // Variables para el salto dinámico
  late AnimationController _jumpController;
  late Animation<double> _jumpAnimation;
  double _playerBottom = 120.0;

  @override
  void initState() {
    super.initState();
    _startWalkingAnimation();
    _startGame();
    _startScoreTimer();
    _startDayNightCycle();

    _titleAnimationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _titleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _titleAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Inicializar el controlador de salto con física real
    _jumpController = AnimationController(
      duration: Duration(milliseconds: 800), // Salto más rápido
      vsync: this,
    );

    // Curva personalizada para el salto (sube rápido, se suspende, baja rápido)
    _jumpAnimation =
        Tween<double>(begin: 120.0, end: 320.0).animate(
            CurvedAnimation(
              parent: _jumpController,
              curve: Curves.easeOutQuad, // Sube rápido y desacelera arriba
              reverseCurve: Curves.easeInQuad, // Baja acelerando
            ),
          )
          ..addListener(() {
            setState(() {
              _playerBottom = _jumpAnimation.value;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // Mantener suspendido por 100ms
              Future.delayed(Duration(milliseconds: 100), () {
                if (mounted && !_gameOver) {
                  _jumpController.reverse();
                }
              });
            } else if (status == AnimationStatus.dismissed) {
              setState(() {
                _isJumping = false;
                _spriteIndex = 1;
              });
            }
          });
  }

  @override
  void dispose() {
    _walkingTimer?.cancel();
    _obstacleTimer?.cancel();
    _scoreTimer?.cancel();
    _titleAnimationController.dispose();
    _jumpController.dispose();
    super.dispose();
  }

  void _startWalkingAnimation() {
    _walkingTimer = Timer.periodic(Duration(milliseconds: 800), (timer) {
      if (mounted && !_gameOver && !_isJumping) {
        setState(() {
          _spriteIndex = _spriteIndex == 1 ? 2 : 1;
        });
      }
    });
  }

  void _startScoreTimer() {
    _scoreTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_gameOver) {
        setState(() {
          _score++;
          if (_score % 5 == 0) {
            _gameSpeed += 1.0;
          }
        });
      }
    });
  }

  void _startDayNightCycle() {
    Timer.periodic(Duration(seconds: 20), (timer) {
      if (mounted && !_gameOver) {
        setState(() {
          _isDayTime = !_isDayTime;
        });
      }
    });
  }

  void _startGame() {
    _obstacleTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (!_gameOver) {
        setState(() {
          for (var obstacle in _obstacles) {
            obstacle.x -= _gameSpeed;

            if (!obstacle.passed && obstacle.x < 50) {
              obstacle.passed = true;
              _points++;
            }
          }

          _obstacles.removeWhere((obstacle) => obstacle.x < -100);

          if (_obstacles.isEmpty ||
              _obstacles.last.x < MediaQuery.of(context).size.width - 250) {
            Random random = Random();
            if (random.nextInt(100) < 4) {
              _addObstacle();
            }
          }

          if (!_gameOver) {
            _checkCollision();
          }
        });
      }
    });
  }

  void _addObstacle() {
    double screenWidth = MediaQuery.of(context).size.width;

    _obstacles.add(Obstacle(x: screenWidth, y: 120.0, passed: false));
  }

  void _checkCollision() {
    double playerLeft = 50 + 20;
    double playerRight = 50 + 80;
    double playerBottom = _playerBottom;
    double playerTop = playerBottom + 80;

    for (var obstacle in _obstacles) {
      double obstacleLeft = obstacle.x + 10;
      double obstacleRight = obstacle.x + 50;
      double obstacleBottom = obstacle.y + 10;
      double obstacleTop = obstacle.y + 55;

      if (playerRight > obstacleLeft &&
          playerLeft < obstacleRight &&
          playerTop > obstacleBottom &&
          playerBottom < obstacleTop) {
        _endGame();
        return;
      }
    }
  }

  void _endGame() {
    if (_gameOver) return;

    setState(() {
      _gameOver = true;
      _spriteIndex = 4;
    });
    _walkingTimer?.cancel();
    _obstacleTimer?.cancel();
    _scoreTimer?.cancel();
    _jumpController.stop();
  }

  void _resetGame() {
    setState(() {
      _gameOver = false;
      _score = 0;
      _points = 0;
      _gameSpeed = 4.0;
      _obstacles.clear();
      _spriteIndex = 1;
      _isDayTime = true;
      _playerBottom = 120.0;
    });
    _jumpController.reset();
    _startWalkingAnimation();
    _startGame();
    _startScoreTimer();
    _startDayNightCycle();
  }

  void _jump() {
    if (!_isJumping &&
        !_gameOver &&
        _jumpController.status == AnimationStatus.dismissed) {
      setState(() {
        _isJumping = true;
        _spriteIndex = 3;
      });
      _jumpController.forward();
    }
  }

  List<Color> _getSkyColors() {
    if (_isDayTime) {
      return [Color(0xFF4A90E2), Color(0xFF87CEEB), Color(0xFFB0E0E6)];
    } else {
      return [Color(0xFF0F1C2E), Color(0xFF1B2838), Color(0xFF2C3E50)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _jump,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: _getSkyColors(),
                ),
              ),
            ),

            if (!_isDayTime) ...[
              Positioned(top: 120, left: 50, child: _buildStar()),
              Positioned(top: 80, left: 150, child: _buildStar()),
              Positioned(top: 200, left: 250, child: _buildStar()),
              Positioned(top: 150, right: 100, child: _buildStar()),
              Positioned(top: 100, right: 200, child: _buildStar()),
              Positioned(top: 180, right: 50, child: _buildStar()),
              Positioned(top: 140, left: 300, child: _buildStar()),
              Positioned(top: 90, right: 300, child: _buildStar()),
            ],

            Positioned(
              top: 120,
              right: _isDayTime ? 80 : null,
              left: _isDayTime ? null : 80,
              child: AnimatedSwitcher(
                duration: Duration(seconds: 2),
                child: _isDayTime ? _buildSun() : _buildMoon(),
              ),
            ),

            if (_isDayTime) ...[
              Positioned(top: 100, left: 100, child: _buildCloud(60)),
              Positioned(top: 150, right: 80, child: _buildCloud(80)),
              Positioned(top: 200, left: 250, child: _buildCloud(50)),
            ],

            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: ScaleTransition(
                scale: _titleAnimation,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.red],
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      '🔥 HeatProtocol 🔥',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                        color: Colors.yellow,
                        fontFamily: 'Courier',
                        letterSpacing: 3,
                        shadows: [
                          Shadow(
                            blurRadius: 0,
                            color: Colors.black,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 120,
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: _isDayTime
                        ? [
                            Color(0xFF32CD32),
                            Color(0xFF228B22),
                            Color(0xFF006400),
                          ]
                        : [
                            Color(0xFF1a5c1a),
                            Color(0xFF0f4a0f),
                            Color(0xFF003300),
                          ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: CustomPaint(painter: GrassPainter()),
              ),
            ),

            ..._obstacles.map((obstacle) {
              return Positioned(
                bottom: obstacle.y,
                left: obstacle.x,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.5),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Image.asset('images/juegoEmiliano/flama.png', width: 60, height: 60),
                ),
              );
            }).toList(),

            // Jugador con salto dinámico
            Positioned(
              bottom: _playerBottom,
              left: 50.0,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Image.asset(
                    _gameOver
                        ? 'images/juegoEmiliano/4.png'
                        : _isJumping
                        ? 'images/juegoEmiliano/3.png'
                        : 'images/juegoEmiliano/${_spriteIndex}.png',
                    key: ValueKey<String>(
                      _gameOver
                          ? '4'
                          : _isJumping
                          ? '3'
                          : '$_spriteIndex',
                    ),
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 100,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF27AE60), Color(0xFF229954)],
                      ),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.stars, color: Colors.white, size: 28),
                        SizedBox(width: 10),
                        Text(
                          '$_points pts',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Courier',
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 100,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF2C3E50), Color(0xFF34495E)],
                      ),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.yellow, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.timer, color: Colors.yellow, size: 28),
                        SizedBox(width: 10),
                        Text(
                          '$_score seg',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                            fontFamily: 'Courier',
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFE74C3C), Color(0xFFC0392B)],
                      ),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.orange, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.speed, color: Colors.orange, size: 28),
                        SizedBox(width: 10),
                        Text(
                          '${_gameSpeed.toStringAsFixed(1)}x',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontFamily: 'Courier',
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            if (_gameOver)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black87,
                      Colors.red.withOpacity(0.3),
                      Colors.black87,
                    ],
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.red, width: 5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.5),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '💀 GAME OVER 💀',
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.w900,
                            color: Colors.red,
                            fontFamily: 'Courier',
                            letterSpacing: 4,
                            shadows: [
                              Shadow(
                                blurRadius: 20,
                                color: Colors.red,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.orange, Colors.red],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            '¡TE QUEMASTE! 🔥',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Courier',
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.yellow, width: 3),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.stars,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    'Puntos: $_points',
                                    style: TextStyle(
                                      fontSize: 36,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Courier',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.yellow,
                                    size: 32,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    'Tiempo: $_score seg',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Courier',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.speed,
                                    color: Colors.orange,
                                    size: 32,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    'Velocidad: ${_gameSpeed.toStringAsFixed(1)}x',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Courier',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _resetGame,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 25,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: Colors.black, width: 4),
                            ),
                            elevation: 10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.replay, color: Colors.black, size: 32),
                              SizedBox(width: 15),
                              Text(
                                'REINTENTAR',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Courier',
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25,),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/juegoE2');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Nuevo color para diferenciar
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Ir al siguiente juego', style: TextStyle(fontSize: 24, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            if (!_gameOver && _score == 0)
              Positioned(
                bottom: 260,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.red],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.yellow, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.touch_app, color: Colors.yellow, size: 40),
                        SizedBox(height: 10),
                        Text(
                          'TOCA PARA SALTAR',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Courier',
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '¡Evita las flamas! 🔥',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Courier',
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
    );
  }

  Widget _buildCloud(double size) {
    return Container(
      width: size,
      height: size * 0.6,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(size),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildSun() {
    return Container(
      key: ValueKey('sun'),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.yellow.withOpacity(0.6),
            blurRadius: 30,
            spreadRadius: 15,
          ),
        ],
      ),
    );
  }

  Widget _buildMoon() {
    return Container(
      key: ValueKey('moon'),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildStar() {
    return Icon(
      Icons.star,
      color: Colors.white.withOpacity(0.8),
      size: 15,
      shadows: [Shadow(color: Colors.white, blurRadius: 10)],
    );
  }
}

class Obstacle {
  double x;
  double y;
  bool passed;

  Obstacle({required this.x, required this.y, required this.passed});
}

class GrassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF1a6b1a)
      ..strokeWidth = 2;

    Random random = Random(42);

    for (int i = 0; i < 50; i++) {
      double x = random.nextDouble() * size.width;
      double y = random.nextDouble() * 30;

      canvas.drawLine(Offset(x, y), Offset(x, y + 10), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}