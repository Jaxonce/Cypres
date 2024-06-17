import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageTextField extends StatefulWidget {
  @override
  _MessageTextFieldState createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;
  Uint8List? bytes;
  File? file;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkText);
  }

  @override
  void dispose() {
    _controller.removeListener(_checkText);
    _controller.dispose();
    super.dispose();
  }

  void _checkText() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);

    return SizedBox(
        //Permet d'aligner les icons en bas quand le textfield s'agrandit
        child: IntrinsicHeight(
      child: CupertinoTextField(
        placeholder: "Message",
        placeholderStyle: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.45),
          fontSize: 16,
          fontFamily: 'SFProDisplay',
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: const Color(0xff232323),
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        style: const TextStyle(
          color: Color(0xffD7E2D6),
          fontSize: 16,
          fontFamily: 'SFProDisplay',
        ),
        suffix: Align(
          alignment: Alignment.bottomRight,
          child: CupertinoButton(
            onPressed: sendMessage(),
            padding: EdgeInsets.zero,
            child: Icon(
                _controller.text.isNotEmpty
                    ? CupertinoIcons.paperplane_fill
                    : CupertinoIcons.paperplane,
                color: _controller.text.isNotEmpty
                    ? const Color(0xffD0FFE0)
                    : CupertinoColors.systemGrey),
          ),
        ),
        controller: _controller,
        suffixMode: OverlayVisibilityMode.always,
        minLines: 1,
        maxLines: 6,
        contentInsertionConfiguration: ContentInsertionConfiguration(
            allowedMimeTypes: const <String>[
              'image/png',
              'image/gif',
              'image/heic'
            ],
            onContentInserted: (KeyboardInsertedContent data) async {
              if (data.data != null) {
                setState(() {
                  bytes = data.data;
                });
              }
            }),
      ),
    ));
  }

  sendMessage() {}
}
