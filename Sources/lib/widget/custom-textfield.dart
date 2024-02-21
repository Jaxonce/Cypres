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
        child:TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.45),
              fontSize: 16,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.bold,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffD7E2D6),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffD7E2D6),
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
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