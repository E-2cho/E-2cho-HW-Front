import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 배경의 위쪽 절반을 초록색으로 설정
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Container(
              color: Color(0xFF00664F),
            ),
          ),
          // 배경의 아래쪽 절반을 파란색으로 설정
          Positioned(
            top: 500,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Container(
              color: Color(0xFF262046),
            ),
          ),
          Positioned(
            left: 0,
            top: 750,
            child: SizedBox(
              width: 412,
              height: 150,
              child: Image.asset(
                'assets/rfrfrfrf.png',
                width: 400,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 185),
                Container(
                  width: 412,
                  height: 476,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 115),
                      Row(
                        children: [
                          SizedBox(width: 23),
                          SizedBox(
                            width: 170,
                            height: 145,
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
                              },
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, bottom: 30),
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
                          SizedBox(width: 25),
                          SizedBox(
                            width: 170,
                            height: 145,
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
                                // 버튼 클릭 이벤트 처리
                              },
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, bottom: 30),
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
                      SizedBox(height: 25),
                      Row(
                        children: [
                          SizedBox(width: 23),
                          SizedBox(
                            width: 170,
                            height: 145,
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
                                // 버튼 클릭 이벤트 처리
                              },
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, bottom: 30),
                                      child: Text(
                                        '운세 모드',
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
                          SizedBox(width: 25),
                          SizedBox(
                            width: 170,
                            height: 145,
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
                                // 버튼 클릭 이벤트 처리
                              },
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, bottom: 30),
                                      child: Text(
                                        '기기 다시 찾기',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 다른 이미지 요소들 배치
          Positioned(
            left: 90,
            top: 30,
            child: Image.asset(
              'assets/img.png',
              width: 350,
              height: 300,
            ),
          ),
          // 추가 이미지 요소들
          Positioned(
            left: 0,
            top: 20,
            child: Image.asset(
              'assets/grass.png',
              width: 420,
              height: 900,
            ),
          ),
          // 기타 이미지 배치
          Positioned(
            left: 40,
            top: 435,
            child: Image.asset(
              'assets/munzi.png',
              width: 69,
              height: 69,
            ),
          ),
          Positioned(
            left: 43,
            top: 610,
            child: Image.asset(
              'assets/fortune.png',
              width: 30,
              height: 30,
            ),
          ),
          Positioned(
            left: 235,
            top: 610,
            child: Image.asset(
              'assets/bluetoothIcon.png',
              width: 30,
              height: 30,
            ),
          ),
          Positioned(
            left: 235,
            top: 435,
            child: Image.asset(
              'assets/weather.png',
              width: 30,
              height: 30,
            ),
          ),
          Positioned(
            left: 345,
            top: 430,
            child: Image.asset(
              'assets/img_2.png',
              width: 30,
              height: 30,
            ),
          ),
          Positioned(
            left: 150,
            top: 600,
            child: Image.asset(
              'assets/img_2.png',
              width: 30,
              height: 30,
            ),
          ),
          Positioned(
            left: 345,
            top: 600,
            child: Image.asset(
              'assets/img_2.png',
              width: 30,
              height: 30,
            ),
          ),
          Positioned(
            left: 150,
            top: 430,
            child: Image.asset(
              'assets/img_2.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
