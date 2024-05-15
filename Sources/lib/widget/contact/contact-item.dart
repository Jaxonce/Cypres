import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter_vue/data/factories/conversations_factory.dart';
import 'package:test_flutter_vue/model/conversation_model.dart';
import 'package:test_flutter_vue/model/message_model.dart';
import 'package:test_flutter_vue/services/interfaces/conversation_service.dart';

import '../../services/interfaces/contact_service.dart';

class ContactItem extends StatefulWidget {
  final String contactId;
  final ContactService contactService;
  final ConversationService conversationService;
  const ContactItem({super.key, required this.contactService, required this.contactId, required this.conversationService});

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  String? base64Image;
  late List<ConversationModel> conversationModel;
  late ConversationModel currentConversation;
  late MessageModel lastMessage;
  late Image profileImage;

  @override
  void initState() {
    super.initState();
    conversationModel = ConversationsFactory.DTOsToPOCOs(widget.conversationService.getConversations());
    for (var i = 0; i < conversationModel.length; i++) {
      if (widget.contactId == conversationModel[i].contact.id) {
        currentConversation = conversationModel[i];
      }
    }
    base64Image = currentConversation.contact.profilePictureBase64;
    lastMessage = currentConversation.messages.last;
    if (base64Image != null) {
      profileImage = imageFromBase64String(base64Image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/message',arguments: currentConversation);
      },
      child: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10,),
            CircleAvatar(
              radius: 25,
              backgroundImage: profileImage.image,
            ),
            const SizedBox(width: 10,),
            Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text("${currentConversation.contact.firstname} ${currentConversation.contact.lastname}", style: const TextStyle(fontFamily: 'SFProDisplay', fontWeight: FontWeight.bold, fontSize: 19, letterSpacing: 0.4))),
                    Flexible(child: Text("${lastMessage.date.hour}:${lastMessage.date.minute < 10 ? "0${lastMessage.date.minute}" : lastMessage.date.minute}", style: const TextStyle(fontFamily: 'SFProDisplay', fontSize: 14))),
                  ],),
                const SizedBox(width: 30),
                Text(currentConversation.messages.isEmpty ? "" : lastMessage.content, maxLines: 2, style: const TextStyle(fontFamily: 'SFProDisplay', fontSize: 14, color: Color.fromRGBO(255, 255, 255, 0.64), letterSpacing: 0.4))
              ],
            )
            ),
            const SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }

  Future<void> convertImageToBase64() async {
    ByteData data = await rootBundle.load('assets/Flag_of_France.png');
    List<int> bytes = data.buffer.asUint8List();
    String imageBase64 = base64Encode(Uint8List.fromList(bytes));

    setState(() {
      base64Image = imageBase64;
    });
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }
}
