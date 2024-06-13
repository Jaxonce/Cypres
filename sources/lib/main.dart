import 'package:cypres/json/chat-json.dart';
import 'package:cypres/pages/contact-list-page.dart';
import 'package:cypres/pages/edit-event-page.dart';
import 'package:cypres/pages/event-list-page.dart';
import 'package:cypres/pages/home-page.dart';
import 'package:cypres/pages/message-page.dart';
import 'package:cypres/widget/connection/connection-chain-custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import 'dependency_injection.dart' as di;

final GetIt _getIt = GetIt.instance;

void main() {
  di.init();
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
        '/connection': (context) => const ConnectionChainCustom(
            title: "Adresse mail",
            hintText: "louis.dupont@gmail.com",
            nextRoute: "/connection/password",
            type: TextInputType.emailAddress),
        '/connection/password': (context) => const ConnectionChainCustom(
            title: "Mot de passe",
            hintText: "••••••••",
            nextRoute: "/",
            buttonText: "Se Connecter",
            isPassword: true),
        '/signup': (context) => const ConnectionChainCustom(
            title: "Nom", hintText: "Dupont", nextRoute: "/signup/firstname"),
        '/signup/firstname': (context) => const ConnectionChainCustom(
            title: "Prénom", hintText: "Louis", nextRoute: "/signup/mail"),
        '/signup/mail': (context) => const ConnectionChainCustom(
            title: "Adresse mail",
            hintText: "louis.dupont@gmail.com",
            nextRoute: "/signup/password",
            type: TextInputType.emailAddress),
        '/signup/password': (context) => const ConnectionChainCustom(
            title: "Mot de passe",
            hintText: "••••••••",
            nextRoute: "/message",
            buttonText: "Terminer",
            isPassword: true),
        '/message': (context) => MessagePage(),
        '/contact': (context) => ContactPage(),
        '/event': (context) => EventPage(),
        '/event-add': (context) => EditEventPage(),
        '/event/edit': (context) => EditEventPage()
        //'/test':(context) => ChatScreen(username: "Maxence")
      },
    );
  }
}
