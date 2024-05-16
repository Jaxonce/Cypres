import 'package:cypres/model/contact_model.dart';

import 'message_model.dart';

class ConversationModel {
  ContactModel contact;
  List<MessageModel> messages;

  ConversationModel(this.contact, this.messages);
}
