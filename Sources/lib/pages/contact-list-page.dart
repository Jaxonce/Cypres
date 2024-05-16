import 'package:cypres/widget/contact/contact-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

import '../services/interfaces/contact_service.dart';
import '../services/interfaces/conversation_service.dart';

class ContactPage extends StatefulWidget {
  final ContactService contactService;
  final ConversationService conversationService;

  const ContactPage(
      {Key? key,
      required this.contactService,
      required this.conversationService})
      : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
        appBar: SuperAppBar(
            title: const Text("Messages"),
            actions: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                    onPressed: addContact(),
                    child: const Icon(
                      CupertinoIcons.add,
                      color: CupertinoColors.activeBlue,
                    ))
              ],
            ),
            backgroundColor: const Color(0xff06180E),
            border: const Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.15), width: 1)),
            largeTitle: SuperLargeTitle(enabled: false)),
        body: Container(
            decoration: const BoxDecoration(color: Color(0xff06180E)),
            child: CupertinoPageScaffold(
                backgroundColor: Colors.transparent, child: getBody())));
  }

  Widget getBody() {
    return ListView.builder(
      itemCount: widget.conversationService.getConversations().length,
      itemBuilder: (context, index) {
        return ContactItem(
            contactService: widget.contactService,
            contactId: "${1001 + index}",
            conversationService: widget.conversationService);
      },
    );
  }

  addContact() {}
}
