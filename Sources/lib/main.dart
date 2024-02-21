import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter_vue/pages/home-page.dart';
import 'package:test_flutter_vue/pages/connection-page.dart';
import 'package:test_flutter_vue/widget/big-button.dart';
import 'package:test_flutter_vue/widget/connection-chain-custom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyprès',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(0, 0, 0, 1),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/connection': (context) => const ConnectionChainCustom(title: "Adresse mail", hintText: "louis.dupont@gmail.com", nextRoute: "/connection/password", type: TextInputType.emailAddress),
        '/connection/password': (context) => const ConnectionChainCustom(title: "Mot de passe", hintText: "••••••••", nextRoute: "/", buttonText: "Se Connecter", isPassword: true),
        '/signup': (context) => const ConnectionChainCustom(title: "Nom", hintText: "Dupont", nextRoute: "/signup/firstname"),
        '/signup/firstname': (context) => const ConnectionChainCustom(title: "Prénom", hintText: "Louis", nextRoute: "/signup/mail"),
        '/signup/mail': (context) => const ConnectionChainCustom(title: "Adresse mail", hintText: "louis.dupont@gmail.com", nextRoute: "/signup/password", type: TextInputType.emailAddress),
        '/signup/password': (context) => const ConnectionChainCustom(title: "Mot de passe", hintText: "••••••••", nextRoute: "/", buttonText: "Terminer", isPassword: true),
      },
    );
  }
}
