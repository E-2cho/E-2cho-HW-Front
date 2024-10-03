import 'package:flutter/material.dart';

class DeviceSelectionPage extends StatefulWidget {
  @override
  _DeviceSelectionPageState createState() => _DeviceSelectionPageState();
}

class _DeviceSelectionPageState extends State<DeviceSelectionPage> {
  // 리스트에 표시할 기기명과 체크박스 상태를 저장
  final List<String> devices = ['Device 1', 'Device 2', 'Device 3'];
  List<bool> isChecked = [];

  @override
  void initState() {
    super.initState();
    // 초기 체크 상태 설정 (모두 false로)
    isChecked = List<bool>.filled(devices.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final double listWidth = MediaQuery.of(context).size.width * 0.9; // 리스트의 너비 설정

    return Scaffold(
      backgroundColor: Color(0xFF1A143C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 모든 요소를 가운데 정렬
          children: <Widget>[
            Text(
              '기기를 선택하세요',
              style: TextStyle(
                fontSize: 36,
                color: Colors.teal,
                fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 50),
            Container(
              width: listWidth, // 리스트의 너비 설정
              height: 500, // 리스트 높이 설정
              color: Color(0xFFF0EDED),
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      devices[index],
                    ),
                    trailing: Checkbox(
                      value: isChecked[index],
                      activeColor: Colors.deepPurple,
                      checkColor: Colors.white,
                      onChanged: (bool? value) {
                        setState(() {
                          // 체크박스 상태 업데이트
                          isChecked = List<bool>.filled(devices.length, false); // 다른 항목을 선택하면 모두 해제
                          isChecked[index] = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
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
                  // 연결하기 버튼 클릭 시 실행할 동작
                  print('Selected device: ${devices[isChecked.indexOf(true)]}');
                },
                child: Text('연결하기',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}