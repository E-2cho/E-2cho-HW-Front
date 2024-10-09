import 'package:e_2cho/app.dart';
import 'package:e_2cho/core/utils/notification_utils.dart';
import 'package:e_2cho/di/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationUtils.initializeNotifications();
  setupDependencies();
  runApp(MyApp());
}
