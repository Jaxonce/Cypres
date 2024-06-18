import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/DTOs/contact_dto.dart';
import '../../data/DTOs/message_dto.dart';
import '../../utils/local_storage_service.dart';
import '../interfaces/message_service.dart';
import 'package:http/http.dart' as http;

class MessageServiceApi implements MessageService {
  @override
  void sendMessage(MessageDTO m) {
    throw UnimplementedError();
  }

  @override
  Future<List<MessageDTO>> getMessages(String c) async{
    final response = await http
        .get(Uri.parse('${dotenv.env['HOST']}/Message/conversation/$c'), headers: {
          'Authorization': 'Bearer ${await getSavedToken()}'
      });

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map<MessageDTO>((json) => MessageDTO.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load messages');
    }
  }

  @override
  MessageDTO getLastMessage(ContactDTO c) {
    throw UnimplementedError();
  }
}