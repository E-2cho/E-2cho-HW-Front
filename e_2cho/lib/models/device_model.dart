import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceModel {
  final BluetoothDevice device;
  final String id;
  final String name;
  final int? rssi;
  bool isConnected;

  DeviceModel({
    required this.device,
    required this.id,
    required this.name,
    this.rssi,
    this.isConnected = false,
  });

  factory DeviceModel.fromScanResult(ScanResult result) {
    return DeviceModel(
      device: result.device,
      id: result.device.remoteId.toString(),
      name: result.device.platformName.isNotEmpty
          ? result.device.platformName
          : 'Unknown Device',
      rssi: result.rssi,
    );
  }

  @override
  String toString() {
    return 'DeviceModel(id: $id, name: $name, rssi: $rssi, isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
