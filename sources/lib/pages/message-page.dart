import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:cypres/controllers/message-page-controller.dart';
import 'package:cypres/model/contact_model.dart';
import 'package:cypres/model/message_model.dart';
import 'package:cypres/signalr_service.dart';
import 'package:cypres/widget/message/bubble-chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pull_down_button/pull_down_button.dart';

import '../model/conversation_model.dart';
import '../model/user_model.dart';
import '../widget/message/message-bottom-bar-stateful.dart';

class MessagePage extends StatefulWidget {
  final MessagePageController controller = MessagePageController();

  MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> implements Observer {
  SignalRService notif = SignalRService.getInstance()!;
  late Image profileImage;
  ConversationModel? conversation;
  final userConnected = UserModel.getInstance()!;
  ContactModel? contact;

  setContact(ContactModel c) {
    if (contact != null) return;
    contact = c;
    _loadConversation(contact!);
  }

  @override
  void initState() {
    notif.observers.add(this);
    super.initState();
  }

  @override
  void notifyChange() {
    _loadConversation(contact!);
  }

  Future<void> _loadConversation(ContactModel contact) async {
    var tmp = await widget.controller.getConversation(contact);

    setState(() {
      conversation = tmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    setContact(ModalRoute.of(context)!.settings.arguments as ContactModel);

    // Calculer le pourcentage pour le padding
    const double paddingPercentage = 0.12; // 10% de la taille de l'écran
    final double paddingValue = screenHeight * paddingPercentage;

    return CupertinoPageScaffold(
        navigationBar: getTabBar(paddingValue, contact!),
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
                          child: getBody(
                              conversation?.messages.reversed.toList() ?? [],
                              contact!.id),
                        ),
                        MessageBottomBar(
                            conversationMembers: [contact!, userConnected])
                      ],
                    )),
              ]),
            )));
  }

  addFile() {}

  ObstructingPreferredSizeWidget? getTabBar(
      double paddingValue, ContactModel contact) {
    if (contact.profilePictureBytes != null) {
      profileImage = Image.memory(contact.profilePictureBytes!);
    }
    return CupertinoNavigationBar(
      middle: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: profileImage.image,
          ),
          const SizedBox(width: 8),
          Padding(
            padding: EdgeInsets.only(right: paddingValue / 2.5),
            child: Text(contact.firstname ?? "",
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

  Widget getBody(List<MessageModel?> messagesList, String contactId) {
    if (messagesList.isEmpty) {
      return const Center(
        child: Text("No messages"),
      );
    } else {
      messagesList as List<MessageModel>;
    }
    return ListView(
      dragStartBehavior: DragStartBehavior.start,
      reverse: true,
      padding: const EdgeInsets.only(top: 20, bottom: 80),
      children: List.generate(messagesList.length, (index) {
        return CustomChatBubble(
            isMe: messagesList[index].senderId != contactId,
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
