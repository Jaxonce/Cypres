import 'package:cypres/services/interfaces/contact_service.dart';
import 'package:cypres/services/interfaces/conversation_service.dart';
import 'package:cypres/services/interfaces/message_service.dart';
import 'package:cypres/services/stub/contact_service_stub.dart';
import 'package:cypres/services/stub/conversation_service_stub.dart';
import 'package:cypres/services/stub/data_stub.dart';
import 'package:cypres/services/stub/message_service_stub.dart';
import 'package:get_it/get_it.dart';

final GetIt _getIt = GetIt.instance;

Future<void> main() async {
  _getIt.registerSingleton<DataStub>(DataStub());
  _getIt.registerSingleton<ConversationService>(ConversationServiceStub());
  _getIt.registerSingleton<MessageService>(MessageServiceStub());
  _getIt.registerSingleton<ContactService>(ContactServiceStub());

  /*List<ConversationDTO> conversationsFromData =
      _getIt.get<ConversationService>().getConversations();
  List<ConversationModel> conversations =
      await ConversationsFactory.DTOsToPOCOs(conversationsFromData);

  print('Conversations:');
  conversations.forEach((conv) {
    print('\t${conv.contact.firstname}:');
    conv.messages.forEach((mess) => print('\t\t${mess.content}'));
  });*/
}
