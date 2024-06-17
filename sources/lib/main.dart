import 'package:cypres/controllers/authentication-controller.dart';
import 'package:cypres/pages/add-conversation-page.dart';
import 'package:cypres/pages/contact-list-page.dart';
import 'package:cypres/pages/edit-event-page.dart';
import 'package:cypres/pages/event-list-page.dart';
import 'package:cypres/pages/home-page.dart';
import 'package:cypres/pages/message-page.dart';
import 'package:cypres/utils/local_storage_service.dart';
import 'package:cypres/widget/connection/connection-chain-custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'dependency_injection.dart' as di;

final GetIt _getIt = GetIt.instance;

Future<void> main() async {
  di.init();
  await dotenv.load(fileName: "assets/.env");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final AuthenticationController controller =
  _getIt.get<AuthenticationController>();
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var token = getSavedToken();
  var initialRoute = '/';

  void checkToken() async {
    //TODO verif userConnected value
    var token = await getSavedToken();
    if (token != null) {
      widget.controller.verifyToken(token).then((value) {
        if (value) {
          setState(() {
            initialRoute = '/contact';
          });
        }
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cyprès',
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
        barBackgroundColor: CupertinoColors.darkBackgroundGray,
      ),
      initialRoute: initialRoute,
      routes: {
        '/': (context) => const HomePage(),
        '/connection': (context) => const ConnectionChainCustom(
            title: "Adresse mail",
            hintText: "louis.dupont@gmail.com",
            nextRoute: "/connection/password",
            type: TextInputType.emailAddress,
            isConnection: true,
        field: Field.mail,),
        '/connection/password': (context) => const ConnectionChainCustom(
            title: "Mot de passe",
            hintText: "••••••••",
            nextRoute: "/contact",
            buttonText: "Se Connecter",
            isPassword: true,
            isConnection: true,
        field: Field.password,),
        '/signup/lastname': (context) => const ConnectionChainCustom(
            title: "Nom", hintText: "Dupont", nextRoute: "/signup/firstname", field: Field.lastname,),
        '/signup/firstname': (context) => const ConnectionChainCustom(
            title: "Prénom", hintText: "Louis", nextRoute: "/signup/password", field: Field.firstname,),
        '/signup/mail': (context) => const ConnectionChainCustom(
            title: "Adresse mail",
            hintText: "louis.dupont@gmail.com",
            nextRoute: "/signup/lastname",
            type: TextInputType.emailAddress,
        field: Field.mail,),
        '/signup/password': (context) => const ConnectionChainCustom(
            title: "Mot de passe",
            hintText: "••••••••",
            nextRoute: "/contact",
            buttonText: "Terminer",
            isPassword: true,
        field: Field.password,),
        '/message': (context) => MessagePage(),
        '/contact': (context) => ContactPage(),
        '/contact/add': (context) => AddConversationPage(),
        '/event': (context) => EventPage(),
        '/event-add': (context) => EditEventPage(),
        '/event/edit': (context) => EditEventPage()
        //'/test':(context) => ChatScreen(username: "Maxence")
      },
    );
  }
}
