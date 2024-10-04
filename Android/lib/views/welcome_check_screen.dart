import 'package:flutter/material.dart';

class WelcomeCheckScreen extends StatelessWidget {
  final String nickname;

  const WelcomeCheckScreen({super.key, required this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A143C),
      body: Stack(
        children: [
          Positioned(
              left: 15,
              top: 40,
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
              )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '환영합니다',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.teal[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(nickname,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.greenAccent[400],
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 40),
                Image.asset(
                  'assets/icegif-1204.gif',
                  width: 414,
                  height: 314,
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: 260,
                  height: 40,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
