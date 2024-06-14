import 'dart:convert';

import 'package:cypres/data/DTOs/contact_dto.dart';
import 'package:cypres/model/user_model.dart';
import 'package:cypres/services/interfaces/contact_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../utils/local_storage_service.dart';

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
        .get(Uri.parse('http://${dotenv.env['HOST']}/User/$mailAddress/contacts'), headers: {
          'Authorization': 'Bearer ${getSavedToken()}'
      });

    if (response.statusCode == 200) {
      return _parseContacts(response.body);
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
