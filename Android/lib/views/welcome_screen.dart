import 'package:e_2cho/services/user_service.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _nicknameController = TextEditingController();

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Image.asset(
              'assets/jigubon.png',
              width: 216,
              height: 239,
            ),
            SizedBox(height: 20),
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
                color: Colors.greenAccent[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _nicknameController,
                decoration: InputDecoration(
                  hintText: '닉네임',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 260,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () async {
                  try {
                    UserService userService = UserService();
                    Map<String, dynamic> result = await userService
                        .registerUser(_nicknameController.text);

                    print('Result from registerUser: $result');

                    // 등록 성공 시 다음 화면으로 이동
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('등록 성공: ${result['nickname']}')),
                    );
                    Navigator.pushNamed(context, '/welcome_check',
                        arguments: result // 전체 result Map을 전달
                        );
                  } catch (e) {
                    print('Error in onPressed: $e');
                    // 오류 발생 시 사용자에게 알림
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('오류: $e')),
                    );
                  }
                },
                child: Text(
                  '등록하기',
                  style: TextStyle(
                    fontSize: 18,
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
