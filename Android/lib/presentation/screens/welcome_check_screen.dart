import 'package:flutter/material.dart';

class WelcomeCheckScreen extends StatelessWidget {
  const WelcomeCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String nickname = args['nickname'] as String;
    // final int id = args['id'] as int;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1A143C),
      body: Stack(
        children: [
          _buildBackButton(context, screenWidth, screenHeight),
          _buildContent(context, screenWidth, screenHeight, nickname),
        ],
      ),
    );
  }

  Widget _buildBackButton(
      BuildContext context, double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.05,
      top: screenHeight * 0.05,
      child: SizedBox(
        width: screenWidth * 0.08,
        height: screenWidth * 0.08,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            '<',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, double screenWidth,
      double screenHeight, String nickname) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.04,
            ),
          ),
          Text(
            '환영합니다',
            style: TextStyle(
              fontSize: 36,
              color: Colors.teal[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            nickname,
            style: TextStyle(
              fontSize: 36,
              color: Colors.greenAccent[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          // Text(
          //   'User ID: $id',
          //   style: TextStyle(
          //     fontSize: 24,
          //     color: Colors.white,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.04,
            ),
          ),
          Image.asset(
            'assets/icegif-1204.gif',
            width: screenWidth,
            height: screenHeight * 0.43,
          ),
          SizedBox(height: screenHeight * 0.06),
          _buildFindDeviceButton(context, screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildFindDeviceButton(
      BuildContext context, double screenWidth, double screenHeight) {
    return SizedBox(
      width: screenWidth * 0.8,
      height: screenHeight * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal[700],
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/finding');
        },
        child: const Text(
          '기기 찾기',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
