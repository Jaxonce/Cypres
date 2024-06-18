import 'package:get_it/get_it.dart';

import '../model/contact_model.dart';
import '../model/conversation_model.dart';
import '../model/user_model.dart';
import '../services/interfaces/conversation_service.dart';
import '../services/interfaces/user-service.dart';

final GetIt _getIt = GetIt.instance;

class MessagePageController {
  static MessagePageController? _instance;

  final ConversationService _conversationService =
  _getIt.get<ConversationService>();
  final UserService _userService = _getIt.get<UserService>();
  final UserModel? _user = UserModel.getInstance();

  MessagePageController._internal();

  factory MessagePageController() {
    _instance ??= MessagePageController._internal();
    return _instance!;
  }

  static MessagePageController? getInstance() => _instance;

  static void resetInstance() {
    _instance = null;
  }

  Future<ConversationModel?> getConversation(ContactModel contact) async {
    var tmp = ConversationModel.DTOToPOCO(
        await _conversationService.getConversation(contact.id), contact);
    var conversationId = await _conversationService.getConversationId(contact.id, _user!.id);
    await tmp.getMessages(conversationId);
  }

  UserModel? getUserConnected() => _user;
}