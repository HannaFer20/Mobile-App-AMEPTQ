import 'package:flutter/material.dart';

class SettingsAvatar extends StatelessWidget {
  final String childName;

  const SettingsAvatar({super.key, required this.childName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ListView(
        children: const [
          // Contenido de la pestaña Avatar
          _AvatarOption(
            name: 'Porky Fire',
            description: 'Uses a special helmet to warn about hot objects.',
            imageAsset: '', // Image.asset vacío
            buttonText: 'Porky',
          ),
          _AvatarOption(
            name: 'Hydro',
            description: 'Use its water jets to extinguish danger and protect the home.',
            imageAsset: '', // Image.asset vacío
            buttonText: 'Hydro',
          ),
          _AvatarOption(
            name: 'Flammy',
            description: 'Teaches you how to avoid accidents and stay calm.',
            imageAsset: '', // Image.asset vacío
            buttonText: 'Flammy',
          ),
          _AvatarOption(
            name: 'Michi Blaze',
            description: 'The quick cat with sharp reflexes and a special sense',
            imageAsset: '', // Image.asset vacío
            buttonText: 'Blaze',
          ),
        ],
      ),
    );
  }
}

class _AvatarOption extends StatelessWidget {
  final String name;
  final String description;
  final String imageAsset;
  final String buttonText;

  const _AvatarOption({
    required this.name,
    required this.description,
    required this.imageAsset,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del Avatar
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageAsset), // Image.asset vacío
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 15),
          // Nombre y Descripción
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ),
          // Botón de Selección
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFC0702D), // Naranja oscuro del ejemplo
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}