import 'package:cypres/services/api/contact_service_api.dart';
import 'package:cypres/services/api/conversation_service_api.dart';
import 'package:cypres/services/api/message_service_api.dart';
import 'package:cypres/services/api/user_service_api.dart';
import 'package:cypres/services/interfaces/contact_service.dart';
import 'package:cypres/services/interfaces/conversation_service.dart';
import 'package:cypres/services/interfaces/event_service.dart';
import 'package:cypres/services/interfaces/message_service.dart';
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:cypres/services/stub/event_service_stub.dart';
import 'package:cypres/services/stub/message_service_stub.dart';
import 'package:get_it/get_it.dart';

import 'services/stub/data_stub.dart';

final GetIt _getIt = GetIt.instance;

void init() {
  _getIt.registerSingleton<DataStub>(DataStub());

  _initServices();
}

void _initServices() {
  _getIt.registerSingleton<ConversationService>(ConversationServiceAPI());
  _getIt.registerSingleton<MessageService>(MessageServiceApi());
  _getIt.registerSingleton<EventService>(EventServiceStub());
  _getIt.registerSingleton<ContactService>(ContactServiceApi());
  _getIt.registerSingleton<UserService>(UserServiceApi());
}
