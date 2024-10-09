import 'package:e_2cho/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../data/services/user_service.dart';
import '../../core/constants/app_constants.dart';
import '../widgets/custom_text_field.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              _buildLogo(),
              SizedBox(height: 20),
              _buildWelcomeText(),
              SizedBox(height: 10),
              _buildAppTitle(),
              SizedBox(height: 30),
              CustomTextField(
                controller: _nicknameController,
                hintText: '닉네임',
              ),
              SizedBox(height: 40),
              CustomButton(
                text: '등록하기',
                onPressed: _registerUser,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      AppConstants.JIGUBON_IMAGE,
      width: 216,
      height: 239,
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      AppConstants.WELCOME_MESSAGE,
      style: TextStyle(
        fontSize: 36,
        color: AppConstants.SECONDARY_COLOR,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAppTitle() {
    return Text(
      AppConstants.APP_TITLE,
      style: TextStyle(
        fontSize: 36,
        color: AppConstants.ACCENT_COLOR,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void _registerUser() async {
    try {
      UserService userService = UserService();
      Map<String, dynamic> result =
          await userService.registerUser(_nicknameController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('등록 성공: ${result['nickname']}')),
      );
      Navigator.pushNamed(context, '/welcome_check', arguments: result);
    } catch (e) {
      print('Error in onPressed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('오류: $e')),
      );
    }
  }
}
