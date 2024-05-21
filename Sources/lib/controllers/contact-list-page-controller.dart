import 'package:cypres/model/conversation_model.dart';
import 'package:get_it/get_it.dart';

import '../data/factories/conversations_factory.dart';
import '../services/interfaces/contact_service.dart';
import '../services/interfaces/conversation_service.dart';

final GetIt _getIt = GetIt.instance;

class ContactListPageController {
  final ContactService _contactService = _getIt.get<ContactService>();
  final ConversationService _conversationService =
      _getIt.get<ConversationService>();

  int getConversationsNumber() =>
      _conversationService.getConversations().length;

  List<ConversationModel> getConversations() =>
      ConversationsFactory.DTOsToPOCOs(_conversationService.getConversations());
}
