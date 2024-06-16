import 'package:cypres/model/contact_model.dart';
import 'package:cypres/widget/message/popup-surface.dart';
import 'package:flutter/cupertino.dart';

class MessageBottomBar_save extends StatelessWidget {
  const MessageBottomBar_save({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            decoration: const BoxDecoration(color: Color(0xff181818)),
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: IntrinsicHeight(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                        onPressed: addFile(),
                        child: const Icon(
                          CupertinoIcons.paperclip,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext builder) {
                              return CustomPopUpSurface(conversationMembers: [
                                ContactModel("id", "firstname", "lastname",
                                    "profilePictureBase64")
                              ]);
                            },
                          );
                        },
                        child: const Icon(CupertinoIcons.square_grid_2x2,
                            color: CupertinoColors.systemGrey),
                      ),
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }

  addFile() {}
}
