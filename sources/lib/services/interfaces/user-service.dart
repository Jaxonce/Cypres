import 'package:cypres/data/DTOs/user_dto.dart';

abstract class UserService {
  Future<UserDTO> connect(String email);

  void create(UserDTO user);

  Future<UserDTO> register(UserDTO userDTO);

  Future<String> login(String email, String password);

  Future<bool> verifyToken(String token);

  Future<bool> isUserExist(String email);
}
