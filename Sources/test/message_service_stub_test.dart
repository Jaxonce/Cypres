import 'package:test_flutter_vue/model/conversation_model.dart';
import 'package:test_flutter_vue/model/user_model.dart';
import 'package:test_flutter_vue/services/interfaces/conversation_service.dart';
import 'package:test_flutter_vue/services/stub/conversation_service_stub.dart';
import 'package:test_flutter_vue/services/stub/data_stub.dart';

void main() {
  ConversationService conversationService = ConversationServiceStub(DataStub());

  UserModel user = UserModel('Toto');

  List<ConversationModel> conversations = conversationService.getConversation();

  print('Conversations:');
  conversations.forEach((conv) {
    print('\t${conv.contact.name}:');
    conv.messages.forEach((mess) => print('\t\t${mess.content}:'));
  });
}
