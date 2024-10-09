import 'dart:async';

import 'package:e_2cho/domain/usecases/connect_device_usecase.dart';
import 'package:e_2cho/data/models/device_model.dart';
import 'package:flutter/foundation.dart';

class BluetoothController extends ChangeNotifier {
  final ConnectDeviceUseCase _connectDeviceUseCase;

  StreamSubscription<List<DeviceModel>>? _deviceSubscription;

  List<DeviceModel> _devices = [];
  DeviceModel? _selectedDevice;
  bool _isScanning = false;

  BluetoothController(this._connectDeviceUseCase) {
    _deviceSubscription =
        _connectDeviceUseCase.scannedDevices.listen((devices) {
      _devices = devices;
      notifyListeners();
    });
  }

  List<DeviceModel> get devices => _devices;
  DeviceModel? get selectedDevice => _selectedDevice;
  bool get isScanning => _isScanning;

  Future<void> startScan() async {
    if (!_isScanning) {
      _isScanning = true;
      notifyListeners();
      try {
        await _connectDeviceUseCase.startScan();
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
      await _connectDeviceUseCase.stopScan();
      notifyListeners();
    }
  }

  Future<void> connectToDevice(DeviceModel device) async {
    try {
      await _connectDeviceUseCase.connectToDevice(device);
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
        await _connectDeviceUseCase.disconnectFromDevice(_selectedDevice!);
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
    super.dispose();
  }
}
