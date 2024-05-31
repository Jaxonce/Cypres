import 'package:cypres/data/factories/user-factory.dart';
import 'package:cypres/model/conversation_model.dart';
import 'package:cypres/model/user_model.dart';
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../data/factories/conversations_factory.dart';
import '../services/interfaces/contact_service.dart';
import '../services/interfaces/conversation_service.dart';

final GetIt _getIt = GetIt.instance;

class ContactListPageController {
  final UserService _userService = _getIt.get<UserService>();
  final ContactService _contactService = _getIt.get<ContactService>();
  final ConversationService _conversationService =
      _getIt.get<ConversationService>();

  UserModel connectUser() =>
      UserFactory.DTOToPOCO(_userService.connect("km10@gmail.com"));

  int getConversationsNumber() =>
      _conversationService.getConversations().length;

  Future<List<ConversationModel>> getConversations() async =>
      await ConversationsFactory.DTOsToPOCOs(
          _conversationService.getConversations());
}
