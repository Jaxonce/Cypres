
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:test_flutter_vue/json/chat-json.dart';
import 'package:test_flutter_vue/widget/message/bubble-chat.dart';

import '../widget/message/message-bottom-bar-stateful.dart';

class MessagePage extends StatefulWidget {
  final String name;
  final String image;
  const MessagePage({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculer le pourcentage pour le padding
    const double paddingPercentage = 0.12; // 10% de la taille de l'écran
    final double paddingValue = screenHeight * paddingPercentage;

    return CupertinoPageScaffold(
        navigationBar: getTabBar(paddingValue),
        child: ColorfulSafeArea(
            color: const Color(0xff181818),
            top: false,
            child: GestureDetector(
              onTap: () {
                // Fermer le clavier lorsque l'utilisateur clique en dehors du champ de texte ou du clavier
                FocusScope.of(context).unfocus();
              },
              behavior: HitTestBehavior
                  .opaque, // Détecte les gestes même lorsque l'utilisateur clique en dehors du champ de texte ou du clavier,
              child: Stack(children: [
                Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff051f13),
                          Color.fromRGBO(27, 60, 22, 0)
                        ], // Couleurs de votre dégradé
                      ),
                      image: DecorationImage(
                          image: Svg(
                            'assets/bg_multiple_icon.svg',
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      CupertinoPageScaffold(backgroundColor: Colors.transparent, resizeToAvoidBottomInset: true,child: getBody(),),
                      MessageBottomBar()
                    ],)),
              ]),
            )));
  }

  addFile() {}

  ObstructingPreferredSizeWidget? getTabBar(double paddingValue) {
    return CupertinoNavigationBar(
      middle: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(widget.image),
          ),
          const SizedBox(width: 8),
          Padding(
            padding: EdgeInsets.only(right: paddingValue / 2.5),
            child: Text(widget.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontStyle: FontStyle.normal)),
          )
          //change the text 'My contact '+ remove const when we pass a message in the page
        ],
      ),
      previousPageTitle: 'Retour',
      trailing: const Icon(CupertinoIcons.ellipsis_circle, size: 30),
      backgroundColor: const Color.fromRGBO(5, 31, 19, 0.37),
    );
  }

  Widget getBody() {
    return ListView(
      dragStartBehavior: DragStartBehavior.down,
      padding: const EdgeInsets.only(top: 20, bottom: 80),
      children: List.generate(messages.length, (index) {
        return CustomChatBubble(
            isMe: messages[index]['isMe'],
            message: messages[index]['message'],
            time: messages[index]['time'],
            isLast: messages[index]['isLast']);
      }),
    );
  }
}
