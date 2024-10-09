import 'package:flutter/material.dart';

class BackgroundImages extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const BackgroundImages({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: screenWidth * 0.3,
          top: screenHeight * 0.05,
          child: Image.asset(
            'assets/img.png',
            width: screenWidth * 0.7,
            height: screenHeight * 0.4,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 0,
          top: screenHeight * 0.05,
          child: Image.asset(
            'assets/grass.png',
            width: screenWidth,
            height: screenHeight * 0.95,
            fit: BoxFit.fill,
          ),
        ),
        _buildIconImage('assets/munzi.png', screenWidth * 0.1,
            screenHeight * 0.45, screenWidth * 0.15),
        _buildIconImage('assets/fortune.png', screenWidth * 0.11,
            screenHeight * 0.65, screenWidth * 0.05),
        _buildIconImage('assets/bluetoothIcon.png', screenWidth * 0.58,
            screenHeight * 0.65, screenWidth * 0.05),
        _buildIconImage('assets/weather.png', screenWidth * 0.58,
            screenHeight * 0.45, screenWidth * 0.07),
        _buildIconImage('assets/img_2.png', screenWidth * 0.84,
            screenHeight * 0.44, screenWidth * 0.07),
        _buildIconImage('assets/img_2.png', screenWidth * 0.37,
            screenHeight * 0.63, screenWidth * 0.07),
        _buildIconImage('assets/img_2.png', screenWidth * 0.84,
            screenHeight * 0.63, screenWidth * 0.07),
        _buildIconImage('assets/img_2.png', screenWidth * 0.37,
            screenHeight * 0.44, screenWidth * 0.07),
      ],
    );
  }

  Widget _buildIconImage(String asset, double left, double top, double size) {
    return Positioned(
      left: left,
      top: top,
      child: Image.asset(
        asset,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
