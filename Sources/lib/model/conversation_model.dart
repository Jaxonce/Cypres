import 'package:test_flutter_vue/model/contact_model.dart';
import 'package:test_flutter_vue/services/interfaces/message_service.dart';

import 'message_model.dart';

class ConversationModel {
  final MessageService messageService;
  final ContactModel contact;

  List<MessageModel> _messages = [];

  List<MessageModel> get messages => _messages;

  ConversationModel(this.messageService, this.contact) {
    _messages = messageService.getMessages(contact);
  }
}
