import 'dart:async';
import 'package:flutter/foundation.dart';
import '../services/bluetooth_service.dart';
import '../models/device_model.dart';

class BluetoothController extends ChangeNotifier {
  final BluetoothService _bluetoothService = BluetoothService();
  List<DeviceModel> _devices = [];
  DeviceModel? _selectedDevice;
  bool _isScanning = false;

  List<DeviceModel> get devices => _devices;
  DeviceModel? get selectedDevice => _selectedDevice;
  bool get isScanning => _isScanning;

  StreamSubscription<List<DeviceModel>>? _deviceSubscription;

  BluetoothController() {
    _deviceSubscription = _bluetoothService.scannedDevices.listen((devices) {
      _devices = devices;
      print('Devices updated: ${_devices.length}'); // 디버그 로그 추가
      notifyListeners();
    });
  }

  Future<void> startScan() async {
    if (!_isScanning) {
      _isScanning = true;
      notifyListeners();
      try {
        await _bluetoothService.startScan();
      } catch (e) {
        print('Error starting scan: $e');
      } finally {
        _isScanning = false;
        notifyListeners();
      }
    }
  }

  Future<void> stopScan() async {
    if (_isScanning) {
      _isScanning = false;
      notifyListeners();
      await _bluetoothService.stopScan();
    }
  }

  Future<void> connectToDevice(DeviceModel device) async {
    try {
      await _bluetoothService.connectToDevice(device);
      _selectedDevice = device;
      notifyListeners();
    } catch (e) {
      print('Error connecting to device: $e');
      rethrow;
    }
  }

  Future<void> disconnectFromDevice() async {
    if (_selectedDevice != null) {
      try {
        await _bluetoothService.disconnectFromDevice(_selectedDevice!);
        _selectedDevice = null;
        notifyListeners();
      } catch (e) {
        print('Error disconnecting from device: $e');
        rethrow;
      }
    }
  }

  List<DeviceModel> getE2choDevices() {
    return _devices
        .where((device) => device.name.toLowerCase().startsWith('e_2cho'))
        .toList();
  }

  void resetDeviceList() {
    _devices.clear();
    notifyListeners();
  }

  bool isDeviceConnected() {
    return _selectedDevice?.isConnected ?? false;
  }

  @override
  void dispose() {
    _deviceSubscription?.cancel();
    _bluetoothService.dispose();
    super.dispose();
  }
}
