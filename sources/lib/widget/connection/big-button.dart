import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const BigButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Color(0xff1B3C16),
            backgroundColor: Color(0xffD7E2D6), // Couleur du texte
            minimumSize: Size(screenHeight, screenWidth/6.2), // Taille du bouton
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth/6.1),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}