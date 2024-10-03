import 'package:e_2cho/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/bluetooth_controller.dart';
import 'views/welcome_screen.dart';
import 'views/welcome_check_screen.dart';
import 'views/finding_device_screen.dart';
import 'views/device_confirmation_screen.dart';
import 'views/home_screen.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() 
  WidgetsFlutterBinding.ensureInitialized();
  FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BluetoothController(),
      child: MaterialApp(
        title: 'E2cho App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => WelcomeScreen(),
          '/welcome_check': (context) => WelcomeCheckScreen(
              nickname: ModalRoute.of(context)!.settings.arguments as String),
          '/finding': (context) => BluetoothAdapterStateObserver(),
          '/confirmation': (context) => DeviceConfirmationScreen(),
          '/HomeScreen': (context) => HomeScreen()
        },
      ),
    );
  }
}

class BluetoothAdapterStateObserver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothAdapterState>(
      stream: FlutterBluePlus.adapterState,
      initialData: BluetoothAdapterState.unknown,
      builder: (c, snapshot) {
        final adapterState = snapshot.data;
        if (adapterState == BluetoothAdapterState.on) {
          return FindingDeviceScreen();
        }
        return BluetoothOffScreen(adapterState: adapterState);
      },
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key? key, required this.adapterState})
      : super(key: key);

  final BluetoothAdapterState? adapterState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              'Bluetooth Adapter is ${adapterState != null ? adapterState.toString().substring(21).toUpperCase() : 'not available'}.',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
