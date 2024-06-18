import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../data/DTOs/message_dto.dart';
import '../../utils/local_storage_service.dart';
import '../interfaces/message_service.dart';

class MessageServiceApi implements MessageService {
  @override
  Future<void> sendMessage(MessageDTO m, String convId) async {
    final response = await http.post(
        Uri.parse(
            '${dotenv.env['HOST']}/Message?senderId=${m.senderId}&conversationId=$convId&content=${m.content}'),
        headers: {'Authorization': 'Bearer ${await getSavedToken()}'});
    return;
    print(response.statusCode);
    if (response.statusCode != 200) throw Exception('Failed to send message');
  }
}
