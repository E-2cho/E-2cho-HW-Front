import 'package:flutter/material.dart';
import '../models/device_model.dart';

class DeviceSelectionPage extends StatefulWidget {
  final List<DeviceModel> devices;

  DeviceSelectionPage({required this.devices});

  @override
  _DeviceSelectionPageState createState() => _DeviceSelectionPageState();
}

class _DeviceSelectionPageState extends State<DeviceSelectionPage> {
  List<bool> isChecked = [];

  @override
  void initState() {
    super.initState();
    isChecked = List<bool>.filled(widget.devices.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final double listWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      backgroundColor: Color(0xFF1A143C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '기기를 선택하세요',
              style: TextStyle(
                fontSize: 36,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: listWidth,
              height: 500,
              color: Color(0xFFF0EDED),
              child: ListView.builder(
                itemCount: widget.devices.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.devices[index].name),
                    trailing: Checkbox(
                      value: isChecked[index],
                      activeColor: Colors.deepPurple,
                      checkColor: Colors.white,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked =
                              List<bool>.filled(widget.devices.length, false);
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
                  backgroundColor: Colors.teal[700],
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  int selectedIndex = isChecked.indexOf(true);
                  if (selectedIndex != -1) {
                    Navigator.pushReplacementNamed(
                      context,
                      '/confirmation',
                      arguments: widget.devices[selectedIndex],
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('기기를 선택해주세요')),
                    );
                  }
                },
                child: Text('연결하기',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
