import 'package:cypres/services/interfaces/contact_service.dart';
import 'package:cypres/services/interfaces/conversation_service.dart';
import 'package:cypres/services/interfaces/message_service.dart';
import 'package:cypres/services/stub/contact_service_stub.dart';
import 'package:cypres/services/stub/conversation_service_stub.dart';
import 'package:cypres/services/stub/data_stub.dart';
import 'package:cypres/services/stub/message_service_stub.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import 'home-page.dart';

final GetIt _getIt = GetIt.instance;

void main() {
  _getIt.registerSingleton<DataStub>(DataStub());
  _getIt.registerSingleton<ConversationService>(ConversationServiceStub());
  _getIt.registerSingleton<MessageService>(MessageServiceStub());
  _getIt.registerSingleton<ContactService>(ContactServiceStub());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Test',
      initialRoute: '/',
      routes: {'/': (context) => HomePage()},
    );
  }
}
