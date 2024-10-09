import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/app_constants.dart';

class UserService {
  Future<Map<String, dynamic>> registerUser(String nickname) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConstants.BASE_URL}/user/registration/nickname'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'nickname': nickname}),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception(
            'Failed to register user: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error in registerUser: $e');
      throw Exception('Error registering user: $e');
    }
  }
}
