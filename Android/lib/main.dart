import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: welcome(),
    );
  }
}

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색 설정
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100), // 상단 여백
            Image.asset(
              'assets/jigubon.png', // Flutter에서는 이미지 경로를 assets로 지정
              width: 216,
              height: 239,
            ),
            SizedBox(height: 20), // 이미지 아래 여백
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 36,
                color: Colors.teal[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'E^2cho',
              style: TextStyle(
                fontSize: 36,
                color: Colors.greenAccent[400], // 안드로이드 holo_green_light 대응
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 78),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '닉네임',
                  filled: true,
                  fillColor: Colors.white, // 흰색 텍스트 색상
                ),
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 78,
                  child: TextField(
                    decoration: InputDecoration(hintText: '생년', filled: true, fillColor: Colors.white,),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 78,
                  child: TextField(
                    decoration: InputDecoration(hintText: '월', filled: true, fillColor: Colors.white,),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 78,
                  child: TextField(
                    decoration: InputDecoration(hintText: '일', filled: true, fillColor: Colors.white,),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
            SizedBox(
              width: 260,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[700], // 버튼 배경색
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  // 버튼 클릭 이벤트 처리
                },
                child: Text(
                  '등록하기',
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
    );
  }
}

//2번째 화면
class welcomeCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1A143C),
        body: Stack(
          children: [
          // 왼쪽 상단에 위치한 버튼
          Positioned(
            left: 15,  // 왼쪽에서 10px 떨어짐
            top: 40,   // 상단에서 10px 떨어짐
            child: SizedBox(
              width: 35,
              height: 35,
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
                  // 버튼 클릭 시 동작
                },
                child: Text(
                  '<',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                  ),
                ),
              ),
            )
          ),

          // 나머지 요소들을 중앙에 배치
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
              crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
              children: [

                Text(
                  '환영합니다',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.teal[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                    '[닉네임]',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.greenAccent[400],
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 40),
                Image.asset(
                  'assets/icegif-1204.gif',
                  width: 414,
                  height: 314,
                ),
                SizedBox(height: 60),
                SizedBox(
                  width: 260,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[700], // 버튼 배경색
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      // 버튼 클릭 이벤트 처리
                    },
                    child: Text(
                      '기기 찾기',
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
    );
  }
}


class finding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1F0F2A),
        body: Stack(
          children: [
            // 왼쪽 상단에 위치한 버튼
            Positioned(
                left: 15,  // 왼쪽에서 10px 떨어짐
                top: 40,   // 상단에서 10px 떨어짐
                child: SizedBox(
                  width: 35,
                  height: 35,
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
                      // 버튼 클릭 시 동작
                    },
                    child: Text(
                      '<',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
            ),

            // 나머지 요소들을 중앙에 배치
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
                crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
                children: [
                  Image.asset(
                    'assets/device-locator-image-for-e2cho-app--isometric-3d-illustration-style--central-smartphone-with-e2-77421105_1.jpeg',
                    width: 414,
                    height: 339,
                  ),
                  SizedBox(height: 60),
                  Image.asset(
                    'assets/loading.gif',
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 50),
                  Text(
                    '기기 찾는 중..',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class findComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A143C), // 배경색 설정
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '기기를 찾았습니다!',
              style: TextStyle(
                fontSize: 36,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60),
            Image.asset(
              'assets/image_processing20200321-12730-646x6f.gif', // Flutter에서는 이미지 경로를 assets로 지정
              width: 350,
              height: 246,
            ),
            SizedBox(height: 50),
            Container(
              width: 350,
              height: 260,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '[디바이스 이름]',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  SizedBox(height: 5),
                  Text(
                    '이 기기가 맞나요?',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 260,
                    height: 50,
                    child:  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F0F2A), // 버튼 배경색
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),

                        ),
                      ),
                      onPressed: () {
                        // 버튼 클릭 이벤트 처리
                      },
                      child: Text(
                        '예',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 260,
                    height: 50,
                    child:  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300], // 버튼 배경색
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        // 버튼 클릭 이벤트 처리
                      },
                      child: Text(
                        '아니오',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              left: 0,  // 왼쪽에서 115px 떨어짐
              top: 750,   // 상단에서 50px 떨어짐
              child: SizedBox(
                width: 412,
                height : 150,
                child: Image.asset(
                  'assets/rfrfrfrf.png',
                  width: 400,
                  height: 150,
                  fit: BoxFit.cover,
              )
              ),
            ),
            // 나머지 요소들을 중앙에 배치
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
                crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
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
                                  backgroundColor: Colors.redAccent, // 버튼 배경색
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
                                      alignment: Alignment.bottomLeft,  // 텍스트를 왼쪽 아래에 배치
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20, bottom: 30), // 텍스트와 버튼 경계 사이 여백
                                        child: Text(
                                          '미세먼지 모드',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white, // 텍스트 색상 설정
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
                                  backgroundColor: Colors.teal, // 버튼 배경색
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
                                      alignment: Alignment.bottomLeft,  // 텍스트를 왼쪽 아래에 배치
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20, bottom: 30), // 텍스트와 버튼 경계 사이 여백
                                        child: Text(
                                          '기후 모드',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white, // 텍스트 색상 설정
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
                                  backgroundColor: Colors.orangeAccent, // 버튼 배경색
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
                                      alignment: Alignment.bottomLeft,  // 텍스트를 왼쪽 아래에 배치
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20, bottom: 30), // 텍스트와 버튼 경계 사이 여백
                                        child: Text(
                                          '운세 모드',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white, // 텍스트 색상 설정
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
                                  backgroundColor: Colors.blueAccent, // 버튼 배경색
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
                                      alignment: Alignment.bottomLeft,  // 텍스트를 왼쪽 아래에 배치
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20, bottom: 30), // 텍스트와 버튼 경계 사이 여백
                                        child: Text(
                                          '기기 다시 찾기',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white, // 텍스트 색상 설정
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
            // 이미지를 화면의 특정 위치에 배치
            Positioned(
              left: 115,  // 왼쪽에서 115px 떨어짐
              top: 50,   // 상단에서 50px 떨어짐
              child: Image.asset(
                'assets/img.png',
                width: 300,
                height: 300,
              ),
            ),
            Positioned(
              left: 170,  // 왼쪽에서 170px 떨어짐
              top: 120,   // 상단에서 120px 떨어짐
              child: Image.asset(
                'assets/img_1.png',
                width: 272,
                height: 239,
              ),
            ),
            Positioned(
              left: 40,  // 왼쪽에서 170px 떨어짐
              top: 435,   // 상단에서 120px 떨어짐
              child: Image.asset(
                'assets/munzi.png',
                width: 69,
                height: 69,
              ),
            ),
            Positioned(
              left: 43,  // 왼쪽에서 170px 떨어짐
              top: 610,   // 상단에서 120px 떨어짐
              child: Image.asset(
                'assets/fortune.png',
                width: 30,
                height: 30,
              ),
            ),
            Positioned(
              left: 235,  // 왼쪽에서 170px 떨어짐
              top: 610,   // 상단에서 120px 떨어짐
              child: Image.asset(
                'assets/bluetoothIcon.png',
                width: 30,
                height: 30,
              ),
            ),
            Positioned(
              left: 235,  // 왼쪽에서 170px 떨어짐
              top: 435,   // 상단에서 120px 떨어짐
              child: Image.asset(
                'assets/weather.png',
                width: 30,
                height: 30,
              ),
            ),
            Positioned(
              left: 345,  // 왼쪽에서 170px 떨어짐
              top: 430,   // 상단에서 120px 떨어짐
              child: Image.asset(
                'assets/img_2.png',
                width: 30,
                height: 30,
              ),
            ),
            Positioned(
              left: 150,  // 왼쪽에서 170px 떨어짐
              top: 600,   // 상단에서 120px 떨어짐
              child: Image.asset(
                'assets/img_2.png',
                width: 30,
                height: 30,
              ),
            ),
            Positioned(
              left: 345,  // 왼쪽에서 170px 떨어짐
              top: 600,   // 상단에서 120px 떨어짐
              child: Image.asset(
                'assets/img_2.png',
                width: 30,
                height: 30,
              ),
            ),
            Positioned(
              left: 150,  // 왼쪽에서 170px 떨어짐
              top: 430,   // 상단에서 120px 떨어짐
              child: Image.asset(
                'assets/img_2.png',
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
