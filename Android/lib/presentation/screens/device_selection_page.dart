import 'package:flutter/material.dart';
import '../../data/models/device_model.dart';

class DeviceSelectionPage extends StatefulWidget {
  final List<DeviceModel> devices;

  const DeviceSelectionPage({super.key, required this.devices});

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final double listWidth = screenWidth * 0.9;

    return Scaffold(
      backgroundColor: const Color(0xFF1A143C),
      body: Stack(
        children: [
          Positioned(
            left: screenWidth * 0.04,
            top: screenHeight * 0.05,
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
              children: <Widget>[
                const Text(
                  '기기를 선택하세요',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                  ),
                ),
                Container(
                  width: listWidth,
                  height: screenHeight * 0.5,
                  color: const Color(0xFFF0EDED),
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
                              isChecked = List<bool>.filled(
                                  widget.devices.length, false);
                              isChecked[index] = value!;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                SizedBox(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.05,
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
                          const SnackBar(content: Text('기기를 선택해주세요')),
                        );
                      }
                    },
                    child: const Text('연결하기',
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
