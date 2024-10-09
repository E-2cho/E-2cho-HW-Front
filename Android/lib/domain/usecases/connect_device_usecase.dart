import 'package:e_2cho/data/models/device_model.dart';
import 'package:e_2cho/data/repositories/bluetooth_repository.dart';

class ConnectDeviceUseCase {
  final BluetoothRepository _repository;

  ConnectDeviceUseCase(this._repository);

  Future<void> startScan() {
    return _repository.scanDevices();
  }

  Future<void> stopScan() {
    return _repository.stopScan();
  }

  Future<void> connectToDevice(DeviceModel device) {
    return _repository.connectToDevice(device);
  }

  Future<void> disconnectFromDevice(DeviceModel device) {
    return _repository.disconnectFromDevice(device);
  }

  Stream<List<DeviceModel>> get scannedDevices => _repository.scannedDevices;
}
