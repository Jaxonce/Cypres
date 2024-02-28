import 'package:flutter/cupertino.dart';
import 'package:test_flutter_vue/widget/message/popup-surface.dart';
import 'package:test_flutter_vue/widget/message/text-field-message.dart';

class MessageBottomBar extends StatelessWidget {

  const MessageBottomBar({Key? key})
      : super(key: key);

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
                        child: const Icon(CupertinoIcons.paperclip, color: CupertinoColors.systemGrey,),
                      ),
                    ],
                  ),
                  const Expanded(
                      child: MessageTextField(
                        text: "Message",
                      )
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          showCupertinoModalPopup(context: context, builder: (BuildContext builder) {
                              return const CustomPopUpSurface();
                            },
                          );
                        },
                        child: const Icon(CupertinoIcons.square_grid_2x2, color: CupertinoColors.systemGrey),
                      ),
                    ],
                  )
                ],
              ),
            )
        )
      ],
    );
  }

  addFile() {}
}