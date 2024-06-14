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

  @override
  Future<UserDTO> register(UserDTO userDTO) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<String> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyToken(String token) {
    // TODO: implement verifyToken
    throw UnimplementedError();
  }

  @override
  Future<bool> isUserExist(String email) {
    // TODO: implement verifyToken
    throw UnimplementedError();
  }
}
