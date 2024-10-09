import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final double width;
  final double height;

  const SliderWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _sliderValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Slider(
        value: _sliderValue,
        min: 0,
        max: 100,
        onChanged: (double value) {
          setState(() {
            _sliderValue = value;
          });
        },
      ),
    );
  }
}
