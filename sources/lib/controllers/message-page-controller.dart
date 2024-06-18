import 'package:cypres/data/DTOs/message_dto.dart';
import 'package:cypres/model/contact_model.dart';
import 'package:cypres/model/conversation_model.dart';
import 'package:cypres/model/message_model.dart';
import 'package:cypres/services/interfaces/message_service.dart';
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../model/user_model.dart';
import '../services/interfaces/conversation_service.dart';

final GetIt _getIt = GetIt.instance;

class MessagePageController {
  static MessagePageController? _instance;

  final ConversationService _conversationService =
      _getIt.get<ConversationService>();
  final UserService _userService = _getIt.get<UserService>();
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

  Future<ConversationModel?> getConversation(ContactModel contact) async {
    String? userId = UserModel.getInstance()?.id;
    if (userId == null) return null;

    var conversationId =
        await _conversationService.getConversationId(contact.id, userId);
    var dtos =
        await _conversationService.getConversationMessages(conversationId);

    List<MessageModel> pocos = [];
    for (var element in dtos) {
      pocos.add(MessageModel.DTOToPOCO(element));
    }
    return ConversationModel(contact, pocos);
  }

  Future<void> sendMessage(String content, String contactId) async {
    var conversationId = await _conversationService.getConversationId(
        contactId, UserModel.getInstance()!.id);
    _messageService.sendMessage(
        MessageDTO(content, DateTime.now(), UserModel.getInstance()!.id),
        conversationId);
  }
}
