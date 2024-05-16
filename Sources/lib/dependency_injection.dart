import 'package:get_it/get_it.dart';

import 'services/interfaces/contact_service.dart';
import 'services/interfaces/conversation_service.dart';
import 'services/interfaces/message_service.dart';
import 'services/stub/contact_service_stub.dart';
import 'services/stub/conversation_service_stub.dart';
import 'services/stub/data_stub.dart';
import 'services/stub/message_service_stub.dart';

final GetIt _getIt = GetIt.instance;

void init() {
  _getIt.registerSingleton<DataStub>(DataStub());
  _getIt.registerSingleton<ConversationService>(ConversationServiceStub());
  _getIt.registerSingleton<MessageService>(MessageServiceStub());
  _getIt.registerSingleton<ContactService>(ContactServiceStub());
}
