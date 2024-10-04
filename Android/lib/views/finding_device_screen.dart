import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/bluetooth_controller.dart';
import 'dart:async';

class FindingDeviceScreen extends StatefulWidget {
  const FindingDeviceScreen({super.key});

  @override
  _FindingDeviceScreenState createState() => _FindingDeviceScreenState();
}

class _FindingDeviceScreenState extends State<FindingDeviceScreen> {
  bool _canNavigate = false;
  // bool _canNavigate = false;
  bool _hasNavigated = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bluetoothController =
          Provider.of<BluetoothController>(context, listen: false);
      bluetoothController.startScan();

      // 5초 후에 _canNavigate를 true로 설정 t
      Timer(const Duration(seconds: 5), () {
        setState(() {
          _canNavigate = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1F0F2A),
      body: Stack(
        children: [
          Positioned(
            left: screenWidth * 0.04,
            top: screenHeight * 0.04,
            child: SizedBox(
              width: screenWidth * 0.08,
              height: screenWidth * 0.08,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  '<',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/device-locator-image-for-e2cho-app--isometric-3d-illustration-style--central-smartphone-with-e2-77421105_1.jpeg',
                  width: screenWidth,
                  height: screenHeight * 0.35,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05, // 화면 위쪽에 패딩
                  ),
                ),
                Image.asset(
                  'assets/loading.gif',
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05, // 화면 위쪽에 패딩
                  ),
                ),
                const Text('기기 찾는 중..',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ],
            ),
          ),
          Consumer<BluetoothController>(
            builder: (context, controller, child) {
              if (_canNavigate &&
                  controller.devices.isNotEmpty &&
                  !_hasNavigated) {
                _hasNavigated = true;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  controller.stopScan();
                  Navigator.pushReplacementNamed(
                    context,
                    '/confirmation',
                    arguments: controller.devices.first,
                  );
                });
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    final bluetoothController =
        Provider.of<BluetoothController>(context, listen: false);
    bluetoothController.stopScan();
    super.dispose();
  }
}
