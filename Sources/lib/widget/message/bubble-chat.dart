import 'package:flutter/cupertino.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class CustomChatBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final String time;
  final bool isLast;

  const CustomChatBubble(
      {Key? key,required this.isMe,required this.message,required this.time,required this.isLast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message,
      tail: isLast,
      isSender: isMe,
      color: const Color(0xff26252A),
      textStyle: const TextStyle(
          color: CupertinoColors.white,
          fontSize: 16
      ),

    );
  }
}