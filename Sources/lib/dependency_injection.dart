import 'package:cypres/services/interfaces/contact_service.dart';
import 'package:cypres/services/interfaces/conversation_service.dart';
import 'package:cypres/services/interfaces/message_service.dart';
import 'package:cypres/services/stub/contact_service_stub.dart';
import 'package:cypres/services/stub/conversation_service_stub.dart';
import 'package:cypres/services/stub/message_service_stub.dart';
import 'package:get_it/get_it.dart';

import 'controllers/contact-list-page-controller.dart';
import 'services/stub/data_stub.dart';

final GetIt _getIt = GetIt.instance;

void init() {
  _getIt.registerSingleton<DataStub>(DataStub());

  _initServices();
  _initControllers();
}

void _initControllers() {
  _getIt.registerSingleton<ContactListPageController>(
      ContactListPageController());
}

void _initServices() {
  _getIt.registerSingleton<ConversationService>(ConversationServiceStub());
  _getIt.registerSingleton<MessageService>(MessageServiceStub());
  _getIt.registerSingleton<ContactService>(ContactServiceStub());
}
