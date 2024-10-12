import 'package:flutter/material.dart';

class nonDevice extends StatefulWidget {
  const nonDevice({super.key});

  @override
  _nonDeviceState createState() => _nonDeviceState();
}

class _nonDeviceState extends State<nonDevice> {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF191D1E),
      body: Stack(
        children: [
          Positioned(
            left: screenWidth * 0.04,
            top: screenHeight * 0.04,
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
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.45,
                  child: Image.asset(
                    'assets/8b59eaa8d2616cf71b8f2394e4b75d85_w200.gif',
                    width: screenWidth,
                    height: screenHeight * 0.45,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05, // 화면 위쪽에 패딩
                  ),
                ),
                const Text('기기를 찾을 수 없습니다...',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05, // 화면 위쪽에 패딩
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0E688F), // 버튼 배경색
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {

                    },
                    child: const Text('기기 다시 찾기',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}