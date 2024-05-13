import 'package:get_it/get_it.dart';
import 'package:test_flutter_vue/data/factories/conversations_factory.dart';
import 'package:test_flutter_vue/model/conversation_model.dart';
import 'package:test_flutter_vue/services/interfaces/conversation_service.dart';
import 'package:test_flutter_vue/services/interfaces/message_service.dart';
import 'package:test_flutter_vue/services/stub/conversation_service_stub.dart';
import 'package:test_flutter_vue/services/stub/data_stub.dart';
import 'package:test_flutter_vue/services/stub/message_service_stub.dart';

final GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<DataStub>(DataStub());
  getIt.registerSingleton<ConversationService>(ConversationServiceStub());
  getIt.registerSingleton<MessageService>(MessageServiceStub());

  List<ConversationModel> conversations = ConversationsFactory.DTOsToPOCOs(
      getIt.get<ConversationService>().getConversations());

  print('Conversations:');
  conversations.forEach((conv) {
    print('\t${conv.contact.name}:');
    conv.messages.forEach((mess) => print('\t\t${mess.content}:'));
  });
}
