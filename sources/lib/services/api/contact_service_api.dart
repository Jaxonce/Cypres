import 'dart:convert';

import 'package:cypres/data/DTOs/contact_dto.dart';
import 'package:cypres/model/user_model.dart';
import 'package:cypres/services/interfaces/contact_service.dart';
import 'package:http/http.dart' as http;

class ContactServiceApi implements ContactService {
  List<ContactDTO> _parseContacts(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

    return parsed.map<ContactDTO>((json) => ContactDTO.fromJson(json)).toList();
  }

  @override
  Future<List<ContactDTO>> getContacts(String sort) async {
    String? mailAddress = UserModel.getInstance()?.mailAddress;

    if (mailAddress == null) throw Exception('Failed to load contacts');

    final response = await http
        .get(Uri.parse('http://10.0.2.2:5047/User/$mailAddress/contacts'));

    if (response.statusCode == 200) {
      return _parseContacts(response.body);
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}