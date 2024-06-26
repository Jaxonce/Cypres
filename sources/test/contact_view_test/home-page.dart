import 'package:cypres/model/conversation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final GetIt _getIt = GetIt.instance;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConversationModel? conversation;

  @override
  void initState() async {
    super.initState();
    conversation =
        null; /*await ConversationsFactory.DTOToPOCO(
        await _getIt.get<ConversationService>().getConversation("1001"));*/
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text('Name', textAlign: TextAlign.center),
                    ),
                    Expanded(
                        child: conversation != null
                            ? Text(conversation!.contact.firstname,
                                textAlign: TextAlign.center)
                            : const Text('undefined',
                                textAlign: TextAlign.center))
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child:
                          Text('Profile picture', textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Image.memory(
                        conversation!.contact.profilePictureBytes!,
                        fit:
                            BoxFit.cover, // adjust this according to your needs
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text('Messages', textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text(conversation!.messages.first.content,
                          textAlign: TextAlign.center),
                    )
                  ],
                ),
              ],
            )));
  }
}
