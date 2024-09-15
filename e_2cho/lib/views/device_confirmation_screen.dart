import 'package:flutter/material.dart';

class DeviceConfirmationScreen extends StatelessWidget {
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
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('[디바이스 이름]',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        )),
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
                      child: ElevatedButton(
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
                      child: ElevatedButton(
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
                ))
          ],
        ),
      ),
    );
  }
}
