import 'package:flutter/material.dart';

class ObjectSelector extends StatelessWidget {
  final List<String> availableObjects; 

  const ObjectSelector({
    super.key,
    required this.availableObjects, 
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: availableObjects.length, 
            itemBuilder: (context, index) {
              final String objectName = availableObjects[index]; 
              final String imagePath = 'images/juegoMario/$objectName.png';
              
              return Draggable<String>(
                data: objectName,
                
                feedback: Image.asset(
                  imagePath,
                  width: 60, 
                  height: 60,
                  opacity: const AlwaysStoppedAnimation(0.7), 
                ),
                
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                  ),
                ),

                // ignore: sized_box_for_whitespace
                childWhenDragging: Container(
                  width: 50,
                  height: 50,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}