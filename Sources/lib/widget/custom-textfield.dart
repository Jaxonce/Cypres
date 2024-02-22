import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({Key? key, required this.text, this.obscureText = false, this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
        width: screenWidth,
        height: screenWidth/6.2,
        child:CupertinoTextField(
          placeholder: text,
          placeholderStyle: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.45),
            fontSize: 16,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.bold,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),

          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffD7E2D6),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          style: const TextStyle(
            color: Color(0xffD7E2D6),
            fontSize: 16,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.bold,
          ),
        )
    );
  }
}