import 'package:cypres/data/DTOs/user_dto.dart';

abstract class UserService {
  UserDTO connect(String email);

  void create(UserDTO user);
}
