import 'package:cypres/model/contact_model.dart';
import 'package:get_it/get_it.dart';

import '../model/conversation_model.dart';
import '../services/interfaces/conversation_service.dart';

final GetIt _getIt = GetIt.instance;

class MessagePageController {
  final ConversationService _conversationService =
      _getIt.get<ConversationService>();

  Future<ConversationModel?> getConversation(ContactModel contact) async {
    return ConversationModel.DTOToPOCO(
        await _conversationService.getConversation(contact.id), contact);
  }
}
