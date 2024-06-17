
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../services/interfaces/conversation_service.dart';

final GetIt _getIt = GetIt.instance;
class AddConversationController {
  final ConversationService _conversationService = _getIt.get<ConversationService>();
  final UserService _userService = _getIt.get<UserService>();
}