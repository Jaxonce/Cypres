import 'package:cypres/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/contact-list-page-controller.dart';
import '../../model/contact_model.dart';

final GetIt _getIt = GetIt.instance;

class ContactItem extends StatefulWidget {
  final ContactModel contact;

  final ContactListPageController controller = ContactListPageController();

  ContactItem({super.key, required this.contact});

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  MessageModel? lastMessage;

  Future<void> _loadLastMessage() async {
    MessageModel? tmp =
        await widget.controller.getLastMessage(widget.contact.id);
    if (tmp != null) {
      setState(() {
        lastMessage = tmp;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadLastMessage();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/message', arguments: widget.contact);
      },
      child: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 25,
              backgroundImage: widget.contact.profilePictureBytes != null
                  ? MemoryImage(widget.contact.profilePictureBytes!)
                  : null,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                            "${widget.contact.firstname} ${widget.contact.lastname}",
                            style: const TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                letterSpacing: 0.4))),
                    Flexible(
                        child: Text(
                            lastMessage != null
                                ? "${lastMessage!.date.hour}:${lastMessage!.date.minute < 10 ? "0${lastMessage!.date.minute}" : lastMessage!.date.minute}"
                                : "",
                            style: const TextStyle(
                                fontFamily: 'SFProDisplay', fontSize: 14))),
                  ],
                ),
                const SizedBox(width: 30),
                Text(
                    lastMessage != null
                        ? lastMessage!.content.isEmpty
                            ? ""
                            : lastMessage!.content
                        : "",
                    maxLines: 2,
                    style: const TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 14,
                        color: Color.fromRGBO(255, 255, 255, 0.64),
                        letterSpacing: 0.4))
              ],
            )),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
