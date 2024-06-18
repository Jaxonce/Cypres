import 'dart:convert';

import 'package:cypres/data/DTOs/user_dto.dart';
import 'package:cypres/utils/local_storage_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../signalr_service.dart';
import '../interfaces/user-service.dart';

class UserServiceApi implements UserService {
  @override
  Future<UserDTO> connect(String email) async {
    final response = await http.get(
        Uri.parse('${dotenv.env['HOST']}/User/$email'),
        headers: {'Authorization': 'Bearer ${await getSavedToken()}'});
    if (response.statusCode == 200) {
      var dto =
          UserDTO.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      await SignalRService(dto.id).hubConnection?.start();
      return dto;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void create(UserDTO user) {
    // TODO: implement create
  }

  @override
  Future<UserDTO> register(UserDTO userDTO) async {
    var body = userDTO.toJson(userDTO);
    final response =
        await http.post(Uri.parse('${dotenv.env['HOST']}/User/register'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body));
    if (response.statusCode == 201) {
      return UserDTO.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to register user');
    }
  }

  @override
  Future<String> login(String email, String password) async {
    final response = await http.post(Uri.parse(
        '${dotenv.env['HOST']}/User/login?email=$email&password=$password'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<bool> verifyToken(String token) async {
    final response = await http
        .get(Uri.parse('${dotenv.env['HOST']}/User/verifyToken?token=$token'));
    if (response.statusCode == 200) {
      return Future(() => true);
    } else {
      return Future(() => false);
    }
  }

  @override
  Future<bool> isUserExist(String email) async {
    final response =
        await http.get(Uri.parse('${dotenv.env['HOST']}/User/exists/$email'));
    if (response.body == 'true') {
      return Future(() => true);
    } else {
      return Future(() => false);
    }
  }
}
