import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../data/DTOs/user_dto.dart';

final GetIt _getIt = GetIt.instance;

class AuthenticationController {
  static AuthenticationController? _instance;

  AuthenticationController._internal();

  factory AuthenticationController() {
    _instance ??= AuthenticationController._internal();
    return _instance!;
  }

  static AuthenticationController? getInstance() => _instance;

  static void resetInstance() {
    _instance = null;
  }

  final UserService _userService = _getIt.get<UserService>();

  Future<UserDTO> register(UserDTO userDTO) async {
    return await _userService.register(userDTO);
  }

  Future<String> login(String email, String password) async {
    return await _userService.login(email, password);
  }

  Future<bool> verifyToken(String token) async {
    return await _userService.verifyToken(token);
  }

  Future<bool> isUserExist(String email) async {
    return await _userService.isUserExist(email);
  }

  Future<UserDTO> connect(String email) async {
    return await _userService.connect(email);
  }
}
