import '../models/device_model.dart';
import '../services/bluetooth_service.dart';

class BluetoothRepository {
  final BluetoothService _bluetoothService;

  BluetoothRepository(this._bluetoothService);

  Future<void> scanDevices() async {
    await _bluetoothService.startScan();
  }

  Future<void> stopScan() async {
    await _bluetoothService.stopScan();
  }

  Future<void> connectToDevice(DeviceModel device) async {
    await _bluetoothService.connectToDevice(device);
  }

  Future<void> disconnectFromDevice(DeviceModel device) async {
    await _bluetoothService.disconnectFromDevice(device);
  }

  Stream<List<DeviceModel>> get scannedDevices =>
      _bluetoothService.scannedDevices;
}
