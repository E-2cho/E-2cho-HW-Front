import 'package:flutter/material.dart';
import '../../data/models/device_model.dart';
import '../controllers/bluetooth_controller.dart';
import 'package:provider/provider.dart';

class DeviceConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DeviceModel device =
        ModalRoute.of(context)!.settings.arguments as DeviceModel;

    return Scaffold(
      backgroundColor: Color(0xFF1A143C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '기기를 찾았습니다!',
              style: TextStyle(
                fontSize: 36,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60),
            Image.asset(
              'assets/image_processing20200321-12730-646x6f.gif',
              width: 350,
              height: 246,
            ),
            SizedBox(height: 50),
            Container(
              width: 350,
              height: 260,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    device.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '이 기기가 맞나요?',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildButton(
                    context,
                    '예',
                    Color(0xFF1F0F2A),
                    () => _connectToDevice(context, device),
                  ),
                  SizedBox(height: 10),
                  _buildButton(
                    context,
                    '아니오',
                    Colors.grey[300]!,
                    () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 260,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.green[300],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _connectToDevice(BuildContext context, DeviceModel device) async {
    final controller = Provider.of<BluetoothController>(context, listen: false);
    await controller.connectToDevice(device);
    controller.resetDeviceList();
    Navigator.pushReplacementNamed(context, '/HomeScreen');
  }
}
