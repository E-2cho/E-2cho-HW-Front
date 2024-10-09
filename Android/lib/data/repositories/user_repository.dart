// lib/data/repositories/user_repository.dart

import '../services/user_service.dart';

class UserRepository {
  final UserService _userService;

  UserRepository(this._userService);

  Future<Map<String, dynamic>> registerUser(String nickname) async {
    try {
      return await _userService.registerUser(nickname);
    } catch (e) {
      // 에러 처리 및 다시 throw 가능
      throw Exception('Failed to register user: $e');
    }
  }

  // 여기에 다른 사용자 관련 메서드를 추가 예정
  // ex) 사용자 정보 조회, 사용자 정보 업데이트 등
}
