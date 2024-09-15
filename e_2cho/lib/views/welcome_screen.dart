import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
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
                    decoration: InputDecoration(
                      hintText: '생년',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 78,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '월',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 78,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '일',
                      filled: true,
                      fillColor: Colors.white,
                    ),
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
                  Navigator.pushNamed(context, '/finding');
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
