import 'package:flutter/material.dart';
import '../models/device_model.dart';
import '../controllers/bluetooth_controller.dart';
import 'package:provider/provider.dart';

class DeviceConfirmationScreen extends StatelessWidget {
  const DeviceConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceModel device =
        ModalRoute.of(context)!.settings.arguments as DeviceModel;

    return Scaffold(
      backgroundColor: const Color(0xFF1A143C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '기기를 찾았습니다!',
              style: TextStyle(
                fontSize: 36,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            Image.asset(
              'assets/image_processing20200321-12730-646x6f.gif',
              width: 350,
              height: 246,
            ),
            const SizedBox(height: 50),
            Container(
                width: 350,
                height: 260,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(device.name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 5),
                    const Text(
                      '이 기기가 맞나요?',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 260,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1F0F2A),
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          final controller = Provider.of<BluetoothController>(
                              context,
                              listen: false);
                          controller.connectToDevice(device);
                          controller.resetDeviceList(); // 새로 추가된 메서드
                          Navigator.pushReplacementNamed(
                              context, '/HomeScreen');
                        },
                        child: Text(
                          '예',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green[300],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 260,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          // 다시 기기 찾기 화면으로 돌아가기
                          Navigator.pop(context);
                        },
                        child: Text(
                          '아니오',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green[300],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
