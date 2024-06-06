import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:cypres/model/contact_model.dart';
import 'package:cypres/model/conversation_model.dart';
import 'package:cypres/model/message_model.dart';
import 'package:cypres/widget/message/bubble-chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pull_down_button/pull_down_button.dart';

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
  late Image profileImage;
  late ConversationModel currentConversation;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculer le pourcentage pour le padding
    const double paddingPercentage = 0.12; // 10% de la taille de l'écran
    final double paddingValue = screenHeight * paddingPercentage;

    currentConversation =
        ModalRoute.of(context)!.settings.arguments as ConversationModel;

    return CupertinoPageScaffold(
        navigationBar: getTabBar(paddingValue, currentConversation.contact),
        child: ColorfulSafeArea(
            color: const Color(0xff181818),
            top: false,
            child: GestureDetector(
              onTap: () {
                // Fermer le clavier lorsque l'utilisateur clique en dehors du champ de texte ou du clavier
                FocusScope.of(context).unfocus();
              },
              behavior: HitTestBehavior.opaque,
              // Détecte les gestes même lorsque l'utilisateur clique en dehors du champ de texte ou du clavier,
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
                    child: Stack(
                      children: [
                        CupertinoPageScaffold(
                          backgroundColor: Colors.transparent,
                          resizeToAvoidBottomInset: true,
                          child: getBody(currentConversation.messages),
                        ),
                        MessageBottomBar()
                      ],
                    )),
              ]),
            )));
  }

  addFile() {}

  ObstructingPreferredSizeWidget? getTabBar(
      double paddingValue, ContactModel contact) {
    return CupertinoNavigationBar(
      middle: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: contact.profilePictureBytes != null
                ? MemoryImage(contact.profilePictureBytes!)
                : null,
          ),
          const SizedBox(width: 8),
          Padding(
            padding: EdgeInsets.only(right: paddingValue / 2.5),
            child: Text(contact.firstname,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontStyle: FontStyle.normal)),
          )
          //change the text 'My contact '+ remove const when we pass a message in the page
        ],
      ),
      previousPageTitle: 'Retour',
      trailing: PullDownButton(
        itemBuilder: (context) => [
          PullDownMenuItem(
              onTap: getInformation(),
              title: "Information",
              icon: CupertinoIcons.info_circle),
          PullDownMenuItem(
              onTap: deleteConversation(),
              title: "Delete",
              subtitle: "Erase the conversation",
              icon: CupertinoIcons.delete,
              isDestructive: true)
        ],
        buttonBuilder: (context, showMenu) => CupertinoButton(
            onPressed: showMenu,
            padding: EdgeInsets.zero,
            child: const Icon(CupertinoIcons.ellipsis_circle)),
      ),
      backgroundColor: const Color.fromRGBO(5, 31, 19, 0.37),
    );
  }

  Widget getBody(List<MessageModel> messagesList) {
    return ListView(
      dragStartBehavior: DragStartBehavior.down,
      padding: const EdgeInsets.only(top: 20, bottom: 80),
      children: List.generate(messagesList.length, (index) {
        return CustomChatBubble(
            isMe: messagesList[index].receiverId ==
                currentConversation.contact.id,
            message: messagesList[index].content,
            time: messagesList[index].date.hour.toString(),
            isLast: false);
        //TODO Régler le probleme du isLast car je ne sais pas comment savoir que l'element est le dernier
      }),
    );
  }

  deleteConversation() {}

  getInformation() {}
}
