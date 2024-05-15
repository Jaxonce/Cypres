import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter_vue/services/interfaces/contact_service.dart';
import 'package:test_flutter_vue/services/interfaces/conversation_service.dart';
import 'package:test_flutter_vue/services/interfaces/message_service.dart';
import 'package:test_flutter_vue/services/stub/contact_service_stub.dart';
import 'package:test_flutter_vue/services/stub/conversation_service_stub.dart';
import 'package:test_flutter_vue/services/stub/data_stub.dart';
import 'package:test_flutter_vue/services/stub/message_service_stub.dart';

import 'home-page.dart';

final GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<DataStub>(DataStub());
  getIt.registerSingleton<ConversationService>(ConversationServiceStub());
  getIt.registerSingleton<MessageService>(MessageServiceStub());
  getIt.registerSingleton<ContactService>(ContactServiceStub());

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
