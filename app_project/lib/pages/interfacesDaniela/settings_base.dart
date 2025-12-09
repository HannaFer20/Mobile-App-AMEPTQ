import 'package:flutter/material.dart';

// Importa las vistas de contenido (las crearemos a continuación)
import 'settings_avatar.dart';
import 'settings_language.dart';
import 'settings_game.dart';
import '../interfacesDelia/main_menu.dart';

// Definiendo las rutas de las imágenes de fondo y barra inferior
const String _FondoSetting = 'images/fondoSetting.png'; // Asumiendo que tienes esta imagen de fondo
const String _AvatarPlaceholder = 'images/interfacesDelia/gatochat.png';

class SettingsBase extends StatelessWidget {
  static const String routeName = 'settings_base';
  final String childName; // Propiedad para recibir el nombre

  const SettingsBase({super.key, required this.childName});

  @override
  Widget build(BuildContext context) {
    // Definición de las tres pestañas
    const List<Tab> _tabs = [
      Tab(text: 'Avatar'),
      Tab(text: 'Lenguaje'),
      Tab(text: 'Juego'),
    ];

    // Contenido de cada pestaña
    final List<Widget> _tabViews = [
      SettingsAvatar(childName: childName),
      SettingsLanguage(childName: childName),
      SettingsGame(childName: childName),
    ];

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: Stack(
          children: [
            // 1. Fondo (Cielo, Nubes y Fondo Naranja)
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF4C98D4), // Azul/Cielo
                      Color(0xFFE48E44), // Naranja (parte inferior)
                    ],
                    stops: [0.5, 0.5], // Divide a la mitad
                  ),
                ),
              ),
            ),

            // 2. Nubes (Placeholder simple para el cielo)
            Positioned(
              top: 50,
              left: 20,
              child: Container(width: 80, height: 40, decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(20))),
            ),
             Positioned(
              top: 10,
              right: 50,
              child: Container(width: 60, height: 30, decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(15))),
            ),


            // 3. Contenido Principal con Cabecera, Tabs y Vista
            SafeArea(
              child: Column(
                children: [
                  // CABECERA (Perfil del Niño)
                  _buildHeader(childName),
                  
                  // TABS DE NAVEGACIÓN (Avatar, Lenguaje, Juego)
                  TabBar(
                    tabs: _tabs,
                    indicatorColor: Colors.white, // Color del indicador de pestaña
                    labelColor: Colors.white, // Color del texto de la pestaña seleccionada
                    unselectedLabelColor: Colors.black54, // Color del texto de la pestaña no seleccionada
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  // VISTAS DEL CONTENIDO DE LA PESTAÑA
                  Expanded(
                    child: TabBarView(
                      children: _tabViews,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        
        // BOTTOM NAVIGATION BAR
        bottomNavigationBar: _buildBottomNavBar(context, childName),
      ),
    );
  }

  Widget _buildHeader(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagen del Avatar (Perfil)
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFC0702D), width: 4), // Borde naranja oscuro
              image: DecorationImage(
                image: Image.asset(_AvatarPlaceholder).image, // Usar placeholder
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          // Nombre y Nivel
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name, // Muestra el nombre dinámico
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Nivel 12',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context, String childName) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 138, 234, 255), // Azul claro
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomIcon(
            Icons.menu, // O el ícono que uses para el menú
            () {
              Navigator.pushNamedAndRemoveUntil(
                context, 
                MainMenu.routeName, // La ruta de tu MainMenu
                (route) => route.isFirst, // Limpia todas las rutas encima
                arguments: childName, // VUELVE A PASAR EL NOMBRE
              );
            },
          ),
          _buildBottomIcon(Icons.lightbulb, () => print('Ayuda')),
          _buildBottomIcon(Icons.wb_sunny, () => print('Sol')),
          _buildBottomIcon(Icons.adb, () => print('Otro Icono')),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}