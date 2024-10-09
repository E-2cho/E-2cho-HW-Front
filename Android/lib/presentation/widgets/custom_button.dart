import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.BUTTON_WIDTH,
      height: AppConstants.BUTTON_HEIGHT,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.SECONDARY_COLOR,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppConstants.BUTTON_TEXT_STYLE,
        ),
      ),
    );
  }
}
