import 'package:flutter/material.dart';
import 'app_colors.dart';

class OptionCircle extends StatelessWidget {
  final Widget child; // Aquí pasas la imagen (Image.asset...)
  final VoidCallback onTap;

  const OptionCircle({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.iconBorderBlue, width: 4),
          boxShadow: [
             BoxShadow(
              color: AppColors.iconBorderBlue.withOpacity(0.5),
              offset: const Offset(0, 5), // Sombra sólida inferior
              blurRadius: 0,
            ),
          ],
        ),
        child: ClipOval(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: child, // La imagen se renderiza aquí dentro
          ),
        ),
      ),
    );
  }
}