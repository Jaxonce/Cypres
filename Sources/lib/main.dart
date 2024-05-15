import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter_vue/json/chat-json.dart';
import 'package:test_flutter_vue/pages/contact-list-page.dart';
import 'package:test_flutter_vue/pages/home-page.dart';
import 'package:test_flutter_vue/pages/connection-page.dart';
import 'package:test_flutter_vue/pages/message-page.dart';
import 'package:test_flutter_vue/services/interfaces/contact_service.dart';
import 'package:test_flutter_vue/services/interfaces/conversation_service.dart';
import 'package:test_flutter_vue/services/stub/contact_service_stub.dart';
import 'package:test_flutter_vue/services/stub/conversation_service_stub.dart';
import 'package:test_flutter_vue/widget/connection/big-button.dart';
import 'package:test_flutter_vue/widget/connection/connection-chain-custom.dart';
import 'dependency_injection.dart' as di;
import 'dependency_injection.dart';


void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cyprès',
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
        barBackgroundColor: CupertinoColors.darkBackgroundGray,
      ),
      initialRoute: '/contact',
      routes: {
        '/': (context) => const HomePage(),
        '/connection': (context) => const ConnectionChainCustom(title: "Adresse mail", hintText: "louis.dupont@gmail.com", nextRoute: "/connection/password", type: TextInputType.emailAddress),
        '/connection/password': (context) => const ConnectionChainCustom(title: "Mot de passe", hintText: "••••••••", nextRoute: "/", buttonText: "Se Connecter", isPassword: true),
        '/signup': (context) => const ConnectionChainCustom(title: "Nom", hintText: "Dupont", nextRoute: "/signup/firstname"),
        '/signup/firstname': (context) => const ConnectionChainCustom(title: "Prénom", hintText: "Louis", nextRoute: "/signup/mail"),
        '/signup/mail': (context) => const ConnectionChainCustom(title: "Adresse mail", hintText: "louis.dupont@gmail.com", nextRoute: "/signup/password", type: TextInputType.emailAddress),
        '/signup/password': (context) => const ConnectionChainCustom(title: "Mot de passe", hintText: "••••••••", nextRoute: "/message", buttonText: "Terminer", isPassword: true),
        '/message':(context) => MessagePage(name: chatData[1]['name'], image: chatData[3]['img'],),
        '/contact':(context) => ContactPage(contactService: getIt.get<ContactService>(), conversationService: getIt.get<ConversationService>())
        //'/test':(context) => ChatScreen(username: "Maxence")
      },
    );
  }
}
