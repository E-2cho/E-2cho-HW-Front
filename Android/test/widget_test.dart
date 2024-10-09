// test/widget_test.dart

import 'package:e_2cho/di/dependency_injection.dart';
import 'package:e_2cho/domain/usecases/connect_device_usecase.dart';
import 'package:e_2cho/presentation/controllers/bluetooth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:e_2cho/app.dart';
import 'package:e_2cho/core/constants/app_constants.dart';
import 'package:mockito/mockito.dart';

// Mock classes
class MockConnectDeviceUseCase extends Mock implements ConnectDeviceUseCase {}

class MockBluetoothController extends Mock implements BluetoothController {}

void main() {
  setUpAll(() {
    // Set up dependency injection for tests
    final getIt = GetIt.instance;

    // Register mocks
    getIt.registerFactory<ConnectDeviceUseCase>(
        () => MockConnectDeviceUseCase());
    getIt.registerFactory<BluetoothController>(() => MockBluetoothController());

    // Set up other dependencies if needed
    setupDependencies();
  });

  testWidgets('WelcomeScreen shows correct title and button',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the welcome message is displayed
    expect(find.text(AppConstants.WELCOME_MESSAGE), findsOneWidget);
    expect(find.text(AppConstants.APP_TITLE), findsOneWidget);

    // Verify that the registration button is present
    expect(find.widgetWithText(ElevatedButton, '등록하기'), findsOneWidget);
  });

  testWidgets('Tapping registration button navigates to next screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Enter a nickname
    await tester.enterText(find.byType(TextField), 'TestUser');

    // Tap the registration button
    await tester.tap(find.widgetWithText(ElevatedButton, '등록하기'));
    await tester.pumpAndSettle();

    // Verify that we've navigated to the WelcomeCheckScreen
    // This assumes that WelcomeCheckScreen has a specific widget or text that identifies it
    expect(find.text('환영합니다'), findsOneWidget);
    expect(find.text('TestUser'), findsOneWidget);
  });
}
