import 'package:flutter/material.dart';
import 'app_colors.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.navBarBg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Se ajusta al contenido
        children: const [
          Icon(Icons.menu, color: Colors.orange, size: 28),
          SizedBox(width: 20),
          Icon(Icons.person, color: Colors.orange, size: 28),
          SizedBox(width: 20),
          Icon(Icons.wb_sunny, color: Colors.orange, size: 28),
        ],
      ),
    );
  }
}