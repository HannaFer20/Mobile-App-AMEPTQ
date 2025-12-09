import 'package:flutter/material.dart';


class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/interfacesDelia/fondoMain.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 178, 72),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 3,
                  color: Color.fromARGB(255, 244, 178, 72), //
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('sirve foto');
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('images/interfacesDelia/gatochat.png'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(width: 2, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Niño',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      print('opcion nivel 1');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 79, 195, 247), // Azul claro
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 2,
                          color: Color.fromARGB(255, 79, 195, 247),
                        ),
                      ),
                      child: Text(
                        'Nivel 1',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('funciona apartado del bombero');
              },
              child: Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 250, 120, 50), // Naranja
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: Color.fromARGB(255, 250, 120, 50),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/interfacesDelia/bomberito.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Text(
                        '"Pequeños héroes, grandes acciones"',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // cuadros de juegos
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  children: [
                    // Columna izquierda
                    Expanded(
                      child: Column(
                        children: [
                          // Juego 1
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'lectura_cocina');
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(144, 0, 0, 0),
                                      offset: Offset(1, 7),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'images/interfacesDelia/juego1.png',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        'Lección',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Juego 3
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print('sirve juegos 3');
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(144, 0, 0, 0),
                                      offset: Offset(1, 7),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'images/interfacesDelia/juego3.png',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        'juegos3',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
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
                    SizedBox(width: 20),
                    // Columna derecha
                    Expanded(
                      child: Column(
                        children: [
                          // Juego 2
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print('sirve juegos 2');
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(144, 0, 0, 0),
                                      offset: Offset(1, 7),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'images/interfacesDelia/juego2.png',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        'juegos2',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Juego 4
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print('sirve juegos 4');
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(144, 0, 0, 0),
                                      offset: Offset(1, 7),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'images/interfacesDelia/juego4.png',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        'juegos4',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
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
                  ],
                ),
              ),
            ),

            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 138, 234, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Icono 1
                  GestureDetector(
                    onTap: () {
                      print('sirve el de menu');
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: Icon(Icons.menu, color: Colors.white, size: 40),
                    ),
                  ),
                  // Icono 2
                  GestureDetector(
                    onTap: () {
                      print('sirve el de perfil');
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: Icon(Icons.person, color: Colors.white, size: 40),
                    ),
                  ),
                  // Icono 3
                  GestureDetector(
                    onTap: () {
                      print('sirve el de configuracion');
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}