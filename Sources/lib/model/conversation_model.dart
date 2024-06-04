import 'package:cypres/model/contact_model.dart';
import 'package:get_it/get_it.dart';

import 'message_model.dart';

final GetIt _getIt = GetIt.instance;

class ConversationModel {
  ContactModel contact;
  List<MessageModel> messages;

  ConversationModel(this.contact, this.messages);
}
