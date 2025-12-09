import 'package:flutter/material.dart';

class SettingsGame extends StatelessWidget {
  final String childName;

  const SettingsGame({super.key, required this.childName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          // Título Ajustes
          const Center(
            child: Text(
              'Ajustes',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          const SizedBox(height: 30),

          // Secciones de Ajustes
          _buildSectionTitle('Game'),
          _buildSettingSwitch('Sonido', true),
          _buildSettingSwitch('Vibración', false),
          _buildSettingSwitch('Música', true),
          _buildSettingSwitch('Voz', true),
          
          const Divider(color: Colors.white54, height: 40),

          _buildSectionTitle('Offline'),
          _buildSettingSwitch('Offline', false),

          const Divider(color: Colors.white54, height: 40),

          // Información y Compartir
          _buildOptionButton('Información', () => print('Ir a Información')),
          _buildOptionButton('Compartir', () => print('Compartir App')),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _buildSettingSwitch(String label, bool initialValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        Switch(
          value: initialValue, // Placeholder
          onChanged: (bool value) {},
          activeColor: Colors.red,
        ),
      ],
    );
  }

  Widget _buildOptionButton(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}