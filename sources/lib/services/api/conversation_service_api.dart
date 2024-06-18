import 'dart:convert';

import 'package:cypres/data/DTOs/message_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../data/DTOs/conversation_dto.dart';
import '../../utils/local_storage_service.dart';
import '../interfaces/conversation_service.dart';

class ConversationServiceAPI implements ConversationService {
  ConversationDTO _parseConversation(String responseBody) =>
      ConversationDTO.fromJson(jsonDecode(responseBody));

  MessageDTO _parseMessage(String responseBody) =>
      MessageDTO.fromJson(jsonDecode(responseBody));

  @override
  Future<ConversationDTO> getConversation(String contactId) async {
    final response = await http
        .get(Uri.parse('${dotenv.env['HOST']}/Message/conversation/$contactId'), headers: {
            'Authorization': 'Bearer ${await getSavedToken()}'
    });

    if (response.statusCode == 200) {
      return _parseConversation(response.body);
    } else {
      throw Exception('Failed to load contacts');
    }
  }

  @override
  Future<MessageDTO> getLastMessage(String contactId) async {
    final response = await http.get(Uri.parse(
        '${dotenv.env['HOST']}/Message/conversation/$contactId/last'), headers: {
      'Authorization': 'Bearer ${await getSavedToken()}'
    });

    if (response.statusCode == 200) {
      return _parseMessage(response.body);
    } else {
      throw Exception('Failed to recover message');
    }
  }

  @override
  Future<String> getConversationId(String contactId, String userId) async{
    final response = await http.get(Uri.parse(
        '${dotenv.env['HOST']}/Conversation/id?user1=$contactId&user2=$userId'), headers: {
      'Authorization': 'Bearer ${await getSavedToken()}'});

    if (response.statusCode == 200) {
      return response.body.replaceAll('"', '').replaceAll('\\', '');
    } else {
      throw Exception('Failed to recover conversation id');
    }
  }
}
