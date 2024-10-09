import 'package:flutter/material.dart';
import '../../core/utils/notification_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/background_images.dart';
import '../widgets/slider_widget.dart';
import '../widgets/mode_button.dart';
import '../../core/constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _requestNotificationPermissions();
  }

  Future<void> _requestNotificationPermissions() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      await Permission.notification.request();
    }
  }

  Future<void> _showNotification(String mode) async {
    await NotificationUtils.showNotification(mode);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(screenHeight),
          BackgroundImages(
              screenHeight: screenHeight, screenWidth: screenWidth),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.2),
                _buildModeContainer(screenWidth, screenHeight),
              ],
            ),
          ),
          Positioned(
            left: screenWidth * 0.07,
            top: screenHeight * 0.36,
            child: SliderWidget(
              width: screenWidth * 0.35,
              height: screenWidth * 0.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(double screenHeight) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(color: AppConstants.SECONDARY_COLOR),
        ),
        Expanded(
          flex: 1,
          child: Container(color: AppConstants.PRIMARY_COLOR),
        ),
      ],
    );
  }

  Widget _buildModeContainer(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.07),
          _buildModeButtonRow(screenWidth, screenHeight, [
            ('미세먼지 모드', Colors.redAccent),
            ('기후 모드', Colors.teal),
          ]),
          SizedBox(height: screenHeight * 0.03),
          _buildModeButtonRow(screenWidth, screenHeight, [
            ('온도 모드', Colors.orangeAccent),
            ('예약 모드', Colors.blueAccent),
          ]),
          SizedBox(height: screenHeight * 0.01),
          _buildConnectDeviceButton(screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildModeButtonRow(
      double screenWidth, double screenHeight, List<(String, Color)> modes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: modes
          .map((mode) => ModeButton(
                color: mode.$2,
                text: mode.$1,
                onPressed: () => _showNotification(mode.$1),
              ))
          .toList(),
    );
  }

  Widget _buildConnectDeviceButton(double screenWidth, double screenHeight) {
    return SizedBox(
      width: screenWidth * 0.45,
      height: screenHeight * 0.04,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.ACCENT_COLOR,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS),
          ),
        ),
        onPressed: () {
          // TODO: Implement device connection logic
        },
        child: const Text(
          '다른 기기 연결하기',
          style: AppConstants.BUTTON_TEXT_STYLE,
        ),
      ),
    );
  }
}
