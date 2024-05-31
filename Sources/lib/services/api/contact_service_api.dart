import 'dart:convert';

import 'package:cypres/data/DTOs/contact_dto.dart';
import 'package:cypres/services/interfaces/contact_service.dart';
import 'package:http/http.dart' as http;

class ContactServiceApi implements ContactService {
  @override
  Future<ContactDTO> getContact(String sort) async {
    final response =
        await http.get(Uri.parse('http://localhost:5047/User/$sort'));

    print(response.body);

    if (response.statusCode == 200) {
      return ContactDTO.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  List<ContactDTO> getContacts(String sort) {
    // TODO: implement getContacts
    throw UnimplementedError();
  }
}
