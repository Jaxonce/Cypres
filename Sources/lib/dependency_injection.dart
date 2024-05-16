import 'package:get_it/get_it.dart';

import 'services/interfaces/contact_service.dart';
import 'services/interfaces/conversation_service.dart';
import 'services/interfaces/message_service.dart';
import 'services/stub/contact_service_stub.dart';
import 'services/stub/conversation_service_stub.dart';
import 'services/stub/data_stub.dart';
import 'services/stub/message_service_stub.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<DataStub>(DataStub());
  getIt.registerSingleton<ConversationService>(ConversationServiceStub());
  getIt.registerSingleton<MessageService>(MessageServiceStub());
  getIt.registerSingleton<ContactService>(ContactServiceStub());
}