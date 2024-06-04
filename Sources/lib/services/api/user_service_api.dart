import 'dart:convert';

import 'package:cypres/data/DTOs/user_dto.dart';
import 'package:http/http.dart' as http;

import '../interfaces/user-service.dart';

class UserServiceApi implements UserService {
  @override
  Future<UserDTO> connect(String email) async {
    final response =
        await http.get(Uri.parse('http://localhost:5047/User/$email'));
    if (response.statusCode == 200) {
      return UserDTO.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void create(UserDTO user) {
    // TODO: implement create
  }
}
