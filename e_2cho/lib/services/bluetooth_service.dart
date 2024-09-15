import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../models/device_model.dart';

class BluetoothService {
  final StreamController<List<DeviceModel>> _devicesStreamController =
      StreamController<List<DeviceModel>>.broadcast();
  final List<DeviceModel> _discoveredDevices = [];

  Stream<List<DeviceModel>> get scannedDevices =>
      _devicesStreamController.stream;

  Future<void> startScan() async {
    if (await FlutterBluePlus.adapterState.first == BluetoothAdapterState.on) {
      _discoveredDevices.clear();

      await FlutterBluePlus.startScan(timeout: Duration(seconds: 4));

      FlutterBluePlus.scanResults.listen((results) {
        for (ScanResult r in results) {
          DeviceModel device = DeviceModel.fromScanResult(r);
          if (device.name.toLowerCase().startsWith('e_2cho') &&
              !_discoveredDevices.contains(device)) {
            print('Found e_2cho device: ${device.name}'); // 디버그 로그 추가
            _discoveredDevices.add(device);
            _devicesStreamController.add(_discoveredDevices);
          }
        }
      });
    } else {
      throw Exception("Bluetooth is not on");
    }
  }

  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  Future<void> connectToDevice(DeviceModel device) async {
    try {
      await device.device.connect();
      device.isConnected = true;
      _devicesStreamController.add(_discoveredDevices);
    } catch (e) {
      print('Error connecting to device: $e');
      throw Exception('Failed to connect to device');
    }
  }

  Future<void> disconnectFromDevice(DeviceModel device) async {
    try {
      await device.device.disconnect();
      device.isConnected = false;
      _devicesStreamController.add(_discoveredDevices);
    } catch (e) {
      print('Error disconnecting from device: $e');
      throw Exception('Failed to disconnect from device');
    }
  }

  void dispose() {
    _devicesStreamController.close();
  }
}
