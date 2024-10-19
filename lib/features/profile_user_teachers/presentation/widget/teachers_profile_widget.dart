import 'package:flutter/material.dart';

class TeachersProfileWidget extends StatelessWidget {
  const TeachersProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight * 0.2,
              color: const Color(0xFF62C0A1),
            ),
            Container(
              width: screenWidth,
              height: screenHeight * 0.08,
              color: Colors.white,
            ),
          ],
        ),
        Positioned(
          top: screenHeight * 0.15,
          left: screenWidth * 0.5 - 50,
          right: screenWidth * 0.5 - 50,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/pfpimg.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
