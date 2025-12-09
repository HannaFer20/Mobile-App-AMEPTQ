import 'package:flutter/material.dart';

class SettingsLanguage extends StatelessWidget {
  final String childName;

  const SettingsLanguage({super.key, required this.childName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título Lenguaje
          const Center(
            child: Text(
              'Lenguaje',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          const SizedBox(height: 30),

          // Opción Narración
          _buildSettingRow(
            'Narración',
            Switch(
              value: true, // Placeholder
              onChanged: (bool value) {},
              activeColor: Colors.red,
            ),
          ),

          const SizedBox(height: 20),

          // Opción Lenguaje (Botones)
          _buildLanguageRow(),
        ],
      ),
    );
  }

  Widget _buildSettingRow(String label, Widget control) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        control,
      ],
    );
  }

  Widget _buildLanguageRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lenguaje',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildLanguageButton('English', Colors.red),
              _buildLanguageButton('Spanish', Colors.grey.shade200),
              _buildLanguageButton('French', Colors.grey.shade200),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageButton(String text, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color == Colors.red ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}