import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/bluetooth_controller.dart';
import '../models/device_model.dart';

class FindingDeviceScreen extends StatefulWidget {
  @override
  _FindingDeviceScreenState createState() => _FindingDeviceScreenState();
}

class _FindingDeviceScreenState extends State<FindingDeviceScreen> {
  @override
  void initState() {
    super.initState();
    // 화면이 빌드된 후 스캔 시작
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bluetoothController =
          Provider.of<BluetoothController>(context, listen: false);
      bluetoothController.startScan();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F0F2A),
      body: Stack(
        children: [
          Positioned(
            left: 15,
            top: 40,
            child: SizedBox(
              width: 35,
              height: 35,
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
                child: Text(
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
                  width: 414,
                  height: 339,
                ),
                SizedBox(height: 60),
                Image.asset(
                  'assets/loading.gif',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 50),
                Text('기기 찾는 중..',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Consumer<BluetoothController>(
            builder: (context, controller, child) {
              if (controller.devices.isNotEmpty) {
                // 기기를 찾으면 자동으로 다음 화면으로 이동
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushNamed(
                    context,
                    '/confirmation',
                    arguments: controller.devices.first,
                  );
                });
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // 화면을 나갈 때 스캔 중지
    final bluetoothController =
        Provider.of<BluetoothController>(context, listen: false);
    bluetoothController.stopScan();
    super.dispose();
  }
}
