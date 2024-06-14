import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../data/DTOs/user_dto.dart';
import '../model/user_model.dart';

final GetIt _getIt = GetIt.instance;

class AuthenticationController {
  final UserService _userService = _getIt.get<UserService>();

  Future<UserModel> register(UserDTO userDTO) async {
    return UserModel.DTOToPOCO(await _userService.register(userDTO));
  }

  Future<String> login(String email, String password) async {
    return await _userService.login(email,password);
  }
}