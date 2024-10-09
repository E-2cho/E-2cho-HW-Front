import 'package:flutter/material.dart';

class AppConstants {
  // App Info
  static const String APP_NAME = 'E2cho App';
  static const String APP_TITLE = 'E^2cho';
  static const String WELCOME_MESSAGE = 'Welcome to';

  // API
  static const String BASE_URL = 'http://192.168.68.56:8080/api';

  // Bluetooth
  static const Duration SCAN_TIMEOUT = Duration(seconds: 4);
  static const String E2CHO_DEVICE_PREFIX = 'e_2cho';

  // Colors
  static const Color PRIMARY_COLOR = Color(0xFF1A143C);
  static const Color SECONDARY_COLOR = Color(0xFF00664F);
  static const Color ACCENT_COLOR = Color(0xFF63CE67);
  static const Color BUTTON_COLOR = Color(0xFF1F0F2A);

  // Sizes
  static const double BUTTON_HEIGHT = 50.0;
  static const double BUTTON_WIDTH = 260.0;
  static const double BORDER_RADIUS = 15.0;

  // Text Styles
  static const TextStyle TITLE_STYLE = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle BUTTON_TEXT_STYLE = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  // Asset Paths
  static const String JIGUBON_IMAGE = 'assets/jigubon.png';
  static const String WELCOME_GIF = 'assets/icegif-1204.gif';
  static const String DEVICE_LOCATOR_IMAGE =
      'assets/device-locator-image-for-e2cho-app--isometric-3d-illustration-style--central-smartphone-with-e2-77421105_1.jpeg';
  static const String DEVICE_FOUND_GIF =
      'assets/image_processing20200321-12730-646x6f.gif';

  // Notification
  static const String NOTIFICATION_CHANNEL_ID = '0';
  static const String NOTIFICATION_CHANNEL_NAME = 'Mode';
  static const String NOTIFICATION_CHANNEL_DESCRIPTION = 'Mode';
}
