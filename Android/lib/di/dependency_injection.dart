// lib/di/dependency_injection.dart

import 'package:e_2cho/data/repositories/bluetooth_repository.dart';
import 'package:e_2cho/data/repositories/user_repository.dart';
import 'package:e_2cho/data/services/bluetooth_service.dart';
import 'package:e_2cho/data/services/user_service.dart';
import 'package:get_it/get_it.dart';
import '../domain/usecases/connect_device_usecase.dart';
import '../domain/usecases/register_user_usecase.dart';
import '../presentation/controllers/bluetooth_controller.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  // Services
  getIt.registerLazySingleton<BluetoothService>(() => BluetoothService());
  getIt.registerLazySingleton<UserService>(() => UserService());

  // Repositories
  getIt.registerLazySingleton<BluetoothRepository>(
      () => BluetoothRepository(getIt<BluetoothService>()));
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepository(getIt<UserService>()));

  // Use cases
  getIt.registerLazySingleton(
      () => ConnectDeviceUseCase(getIt<BluetoothRepository>()));
  getIt.registerLazySingleton(
      () => RegisterUserUseCase(getIt<UserRepository>()));

  if (!GetIt.I.isRegistered<BluetoothController>()) {
    getIt.registerFactory(
        () => BluetoothController(getIt<ConnectDeviceUseCase>()));
  }
}
