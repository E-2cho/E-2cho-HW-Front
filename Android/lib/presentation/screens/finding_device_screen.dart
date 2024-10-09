import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_2cho/presentation/controllers/bluetooth_controller.dart';
import 'package:e_2cho/data/models/device_model.dart';
import 'package:e_2cho/presentation/screens/device_selection_page.dart'; // 이 줄을 추가
import 'dart:async';

class FindingDeviceScreen extends StatefulWidget {
  @override
  _FindingDeviceScreenState createState() => _FindingDeviceScreenState();
}

class _FindingDeviceScreenState extends State<FindingDeviceScreen> {
  bool _canNavigate = false;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bluetoothController =
          Provider.of<BluetoothController>(context, listen: false);
      bluetoothController.startScan();

      Timer(Duration(seconds: 10), () {
        setState(() {
          _canNavigate = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F0F2A),
      body: Stack(
        children: [
          _buildBackButton(),
          _buildContent(),
          _buildDeviceList(),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
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
          ),
          onPressed: () => Navigator.pop(context),
          child: Text(
            '<',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Center(
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
          Text(
            '기기 찾는 중..',
            style: TextStyle(
              fontSize: 40,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceList() {
    return Consumer<BluetoothController>(
      builder: (context, controller, child) {
        if (_canNavigate && !_hasNavigated) {
          _hasNavigated = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.stopScan();
            List<DeviceModel> e2choDevices = controller.getE2choDevices();
            if (e2choDevices.length >= 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DeviceSelectionPage(devices: e2choDevices),
                ),
              );
            } else if (e2choDevices.length == 1) {
              Navigator.pushReplacementNamed(
                context,
                '/confirmation',
                arguments: e2choDevices.first,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('E2cho 디바이스를 찾지 못했습니다.')),
              );
            }
          });
        }
        return SizedBox.shrink();
      },
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
