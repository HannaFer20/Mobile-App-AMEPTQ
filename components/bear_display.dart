import 'package:flutter/material.dart';

class BearDisplay extends StatelessWidget {
  final bool isCured; 
  
  const BearDisplay({super.key, required this.isCured});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 432,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 6),
            color: Colors.black26,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack( 
          children: [
            // Imagen del oso
            Image.asset(
              'images/oso.png',
              width: 300,
              height: 400,
              fit: BoxFit.cover,
            ),
            
            if (isCured)
              const Center(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 150,
                ),
              ),
          ],
        ),
      ),
    );
  }
}