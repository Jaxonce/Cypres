import 'package:cypres/model/message_model.dart';
import 'package:cypres/services/interfaces/message_service.dart';
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../data/DTOs/message_dto.dart';
import '../model/contact_model.dart';
import '../model/conversation_model.dart';
import '../model/user_model.dart';
import '../services/interfaces/conversation_service.dart';
import '../services/interfaces/conversation_service.dart';
import '../services/interfaces/user-service.dart';

final GetIt _getIt = GetIt.instance;

class MessagePageController {
  static MessagePageController? _instance;

  final ConversationService _conversationService =
  _getIt.get<ConversationService>();
  final UserService _userService = _getIt.get<UserService>();
  //final ConversationService _conversationService = _getIt.get<ConversationService>();
  final MessageService _messageService = _getIt.get<MessageService>();


  MessagePageController._internal();

  factory MessagePageController() {
    _instance ??= MessagePageController._internal();
    return _instance!;
  }

  static MessagePageController? getInstance() => _instance;

  static void resetInstance() {
    _instance = null;
  }

  // Future<ConversationModel?> getMessages(ContactModel contact) async {
  //   var conversationId = await _conversationService.getConversationId(contact.id, _user!.id);
  //   var tmp = ConversationModel.DTOToPOCO(
  //       await _conversationService.getConversation(conversationId), contact);
  //   await tmp.getMessages(conversationId);
  // }

  Future<List<MessageModel?>> getMessages(String contactId) async {
    List<MessageDTO?> messages = [];
    var _user = await UserModel.getInstance();
    var conversationId = await _conversationService.getConversationId(contactId, _user!.id);

    messages = await _messageService.getMessages(conversationId);
    return messages.map((e) => MessageModel.DTOToPOCO(e!)).toList();
  }
}
