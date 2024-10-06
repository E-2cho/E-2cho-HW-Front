import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/bluetooth_controller.dart';
import 'views/welcome_screen.dart';
import 'views/welcome_check_screen.dart';
import 'views/finding_device_screen.dart';
import 'views/device_confirmation_screen.dart';
import 'views/home_screen.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);

  // Android 초기화 설정
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // iOS 초기화 설정 추가
  final DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  // 초기화 설정
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
  // 초기화
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) async {
      // 알림 선택 시 실행할 코드
      String? payload = response.payload;
      print("Selected Notification Payload: $payload");
      // 여기에서 원하는 작업을 수행하세요
    },
  );

  // 알림 채널 생성
  await _createNotificationChannel();

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
          '/welcome_check': (context) => WelcomeCheckScreen(), // 변경된 부분
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

// 알림 채널 생성 함수
Future<void> _createNotificationChannel() async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    '0', // 채널 ID
    'Mode', // 채널 이름
    description: 'Mode', // 채널 설명
    importance: Importance.high, // 중요도 설정
    playSound: false, // 소리 재생 여부
    showBadge: true, // 배지 표시 여부
  );

  // 채널 생성
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}
