import 'package:test_flutter_vue/model/contact_model.dart';
import 'package:test_flutter_vue/model/message_model.dart';

abstract class MessageService {
  void sendMessage(MessageModel m);

  List<MessageModel> getMessages(ContactModel c);
}
