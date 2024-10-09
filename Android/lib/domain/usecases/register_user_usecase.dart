import 'package:e_2cho/data/repositories/user_repository.dart';

class RegisterUserUseCase {
  final UserRepository _repository;

  RegisterUserUseCase(this._repository);

  Future<Map<String, dynamic>> execute(String nickname) {
    return _repository.registerUser(nickname);
  }
}
