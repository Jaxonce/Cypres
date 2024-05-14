import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter_vue/widget/message/popup-surface.dart';
import 'package:test_flutter_vue/widget/message/text-field-message.dart';

class MessageBottomBar extends StatefulWidget {
  @override
  _MessageBottomBarState createState() => _MessageBottomBarState();
}

class _MessageBottomBarState extends State<MessageBottomBar> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if(pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Aucune image selectionné');
      }
    });
  }

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
                        onPressed: getImage,
                        child: const Icon(CupertinoIcons.paperclip, color: CupertinoColors.systemGrey,),
                      ),
                    ],
                  ),
                  Expanded(
                      child: MessageTextField()
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