import 'package:cypres/data/DTOs/user_dto.dart';

import '../interfaces/user-service.dart';
import 'base_stub.dart';

class UserServiceStub extends BaseStub implements UserService {
  @override
  Future<UserDTO> connect(String email) async => stub().user;

  @override
  void create(UserDTO user) {
    stub().user = user;
  }
}