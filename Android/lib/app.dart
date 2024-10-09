import 'package:e_2cho/presentation/controllers/bluetooth_controller.dart';
import 'package:e_2cho/presentation/screens/device_confirmation_screen.dart';
import 'package:e_2cho/presentation/screens/device_selection_page.dart';
import 'package:e_2cho/presentation/screens/finding_device_screen.dart';
import 'package:e_2cho/presentation/screens/home_screen.dart';
import 'package:e_2cho/presentation/screens/welcome_check_screen.dart';
import 'package:e_2cho/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'core/constants/app_constants.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<BluetoothController>(),
      child: MaterialApp(
        title: AppConstants.APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => WelcomeScreen(),
          '/welcome_check': (context) => WelcomeCheckScreen(),
          '/finding': (context) => FindingDeviceScreen(),
          '/confirmation': (context) => DeviceConfirmationScreen(),
          '/HomeScreen': (context) => HomeScreen(),
          '/device_selection': (context) => DeviceSelectionPage(devices: []),
        },
      ),
    );
  }
}
