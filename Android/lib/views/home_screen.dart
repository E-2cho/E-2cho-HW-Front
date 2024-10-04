import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../main.dart'; // 알림 플러그인 가져오기
import 'package:permission_handler/permission_handler.dart'; // 권한 요청을 위한 패키지

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  double sliderValue = 50.0;

  @override
  void initState() {
    super.initState();
    _requestNotificationPermissions(); // 알림 권한 요청
  }

  Future<void> _requestNotificationPermissions() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      await Permission.notification.request();
    }
  }

  Future<void> _showNotification(String mode) async {
    print('Showing notification for mode: $mode');
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      '0', // 여기에 위에서 설정한 채널 ID를 사용합니다.
      'Mode',
      channelDescription: 'Mode',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // 알림 ID
      '활성 모드', // 제목
      '$mode 실행 중', // 내용
      platformChannelSpecifics,
      payload: mode,
    );
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // 배경의 위쪽 절반을 초록색으로 설정
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight / 2,
            child: Container(
              color: const Color(0xFF00664F),
            ),
          ),
          // 배경의 아래쪽 절반을 파란색으로 설정
          Positioned(
            top: screenHeight / 2,
            left: 0,
            right: 0,
            height: screenHeight / 2,
            child: Container(
              color: const Color(0xFF262046),
            ),
          ),
          Positioned(
            left: 0,
            top: screenHeight * 0.85,
            child: SizedBox(
              width: screenWidth,
              height: screenHeight * 0.15,
              child: Image.asset(
                'assets/rfrfrfrf.png',
                width: screenWidth,
                height: screenHeight * 0.15,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.2, // 화면 위쪽에 패딩
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.07, // 화면 위쪽에 패딩
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.41,
                            height: screenHeight * 0.16,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                // 버튼 클릭 이벤트 처리
                                _showNotification('미세먼지 모드');
                              },
                              child: const Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 20, bottom: 30),
                                      child: Text(
                                        '미세먼지 모드',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.41,
                            height: screenHeight * 0.16,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                _showNotification('기후 모드');
                              },
                              child: const Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 20, bottom: 30),
                                      child: Text(
                                        '기후 모드',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.03, // 화면 위아래 패딩
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.41,
                            height: screenHeight * 0.16,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                _showNotification('온도 모드');
                              },
                              child: const Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 20, bottom: 30),
                                      child: Text(
                                        '온도 모드',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.41,
                            height: screenHeight * 0.16,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                _showNotification('예약 모드');
                              },
                              child: const Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 20, bottom: 30),
                                      child: Text(
                                        '예약 모드',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01, // 화면 위쪽에 패딩
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.45,
                        height: screenHeight * 0.04,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF63CE67),
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            // 버튼 클릭 이벤트 처리
                          },
                          child: const Text(
                            '다른 기기 연결하기',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: screenWidth * 0.07,
              top: screenHeight * 0.36,
              child: SizedBox(
                width: screenWidth * 0.35,
                height: screenWidth * 0.1,
                child: Slider(
                    value: sliderValue,
                    min: 0,
                    max: 100,
                    onChanged: (double value) {
                      setState(() {
                        sliderValue = value;
                      });
                    }),
              )),
         IgnorePointer(
           child: Stack(
             children: [
               // 다른 이미지 요소들 배치
               Positioned(
                   left: screenWidth * 0.3,
                   top: screenHeight * 0.05,
                   child: SizedBox(
                     width: screenWidth * 0.7,
                     height: screenHeight * 0.4,
                     child: Image.asset(
                       'assets/img.png',
                       width: screenWidth * 0.7,
                       height: screenHeight * 0.4,
                       fit: BoxFit.fill,
                     ),
                   )
               ),
               // 추가 이미지 요소들
               Positioned(
                   left: 0,
                   top: screenHeight * 0.05,
                   child: SizedBox(
                     width: screenWidth,
                     height: screenHeight * 0.95,
                     child: Image.asset(
                       'assets/grass.png',
                       width: screenWidth,
                       height: screenHeight,
                       fit: BoxFit.fill,
                     ),
                   )
               ),
               // 기타 이미지 배치
               Positioned(
                   left: screenWidth * 0.1,
                   top: screenHeight * 0.45,
                   child: SizedBox(
                     width: screenWidth * 0.15,
                     height: screenWidth * 0.15,
                     child: Image.asset(
                       'assets/munzi.png',
                       width: 30,
                       height: 30,
                       fit: BoxFit.contain,
                     ),
                   )
               ),
               Positioned(
                   left: screenWidth * 0.11,
                   top: screenHeight * 0.65,
                   child: SizedBox(
                     width: screenWidth * 0.05,
                     height: screenWidth * 0.05,
                     child: Image.asset(
                       'assets/fortune.png',
                       width: 30,
                       height: 30,
                       fit: BoxFit.contain,
                     ),
                   )
               ),
               Positioned(
                   left: screenWidth * 0.58,
                   top: screenHeight * 0.65,
                   child: SizedBox(
                     width: screenWidth * 0.05,
                     height: screenWidth * 0.05,
                     child: Image.asset(
                       'assets/bluetoothIcon.png',
                       width: 30,
                       height: 30,
                       fit: BoxFit.contain,
                     ),
                   )
               ),
               Positioned(
                   left: screenWidth * 0.58,
                   top: screenHeight * 0.45,
                   child: SizedBox(
                     width: screenWidth * 0.07,
                     height: screenWidth * 0.07,
                     child: Image.asset(
                       'assets/weather.png',
                       width: 30,
                       height: 30,
                       fit: BoxFit.contain,
                     ),
                   )
               ),
               Positioned(
                 left: screenWidth * 0.84,
                 top: screenHeight * 0.44,
                 child: Image.asset(
                   'assets/img_2.png',
                   width: screenWidth * 0.07,
                   height: screenWidth * 0.07,
                 ),
               ),
               Positioned(
                 left: screenWidth * 0.37,
                 top: screenHeight * 0.63,
                 child: Image.asset(
                   'assets/img_2.png',
                   width: screenWidth * 0.07,
                   height: screenWidth * 0.07,
                 ),
               ),
               Positioned(
                 left: screenWidth * 0.84,
                 top: screenHeight * 0.63,
                 child: Image.asset(
                   'assets/img_2.png',
                   width: screenWidth * 0.07,
                   height: screenWidth * 0.07,
                 ),
               ),
               Positioned(
                 left: screenWidth * 0.37,
                 top: screenHeight * 0.44,
                 child: Image.asset(
                   'assets/img_2.png',
                   width: screenWidth * 0.07,
                   height: screenWidth * 0.07,
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}
