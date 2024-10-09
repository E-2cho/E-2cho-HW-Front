import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../models/device_model.dart';
import '../../core/constants/app_constants.dart';

class BluetoothService {
  final StreamController<List<DeviceModel>> _devicesStreamController =
      StreamController<List<DeviceModel>>.broadcast();
  final List<DeviceModel> _discoveredDevices = [];

  Stream<List<DeviceModel>> get scannedDevices =>
      _devicesStreamController.stream;

  Future<void> startScan() async {
    if (await FlutterBluePlus.adapterState.first == BluetoothAdapterState.on) {
      _discoveredDevices.clear();

      await FlutterBluePlus.startScan(timeout: AppConstants.SCAN_TIMEOUT);

      FlutterBluePlus.scanResults.listen((results) {
        for (ScanResult r in results) {
          DeviceModel device = DeviceModel.fromScanResult(r);
          if (device.name
                  .toLowerCase()
                  .startsWith(AppConstants.E2CHO_DEVICE_PREFIX) &&
              !_discoveredDevices.contains(device)) {
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
      throw Exception('Failed to connect to device: $e');
    }
  }

  Future<void> disconnectFromDevice(DeviceModel device) async {
    try {
      await device.device.disconnect();
      device.isConnected = false;
      _devicesStreamController.add(_discoveredDevices);
    } catch (e) {
      throw Exception('Failed to disconnect from device: $e');
    }
  }

  void dispose() {
    _devicesStreamController.close();
  }
}
