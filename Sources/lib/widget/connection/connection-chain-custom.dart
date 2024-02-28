import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_flutter_vue/widget/connection/custom-textfield.dart';

import 'big-button.dart';

class ConnectionChainCustom extends StatelessWidget {
  final String title;
  final String hintText;
  final String nextRoute;
  final String buttonText;
  final bool isPassword;
  final TextInputType type;

  const ConnectionChainCustom({Key? key, required this.title, required this.hintText, required this.nextRoute, this.buttonText = "Continuer", this.isPassword = false, this.type = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculer le pourcentage pour le padding
    const double paddingPercentage = 0.12; // 10% de la taille de l'écran
    final double paddingValue = screenHeight * paddingPercentage;

    return CupertinoPageScaffold(
      child: Container(
        padding: EdgeInsets.only(top: paddingValue, left: 35, right:35),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffb051F13), Color.fromRGBO(27, 60, 22, 0)], // Couleurs de votre dégradé
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 26,
                  color: Color(0xffE1E1E1), // Couleur du texte
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              SizedBox(height: paddingValue/1.4), // Espacement entre l'image et le texte
              CustomTextField(text: hintText, obscureText: isPassword, keyboardType: type),
              SizedBox(height: paddingValue/2.5), // Espacement entre le texte et le bouton
              BigButton(
                text: buttonText,
                onPressed: () {
                  Navigator.pushNamed(context, nextRoute);
                },
              ),// Espacement entre le bouton et le texte
            ],
          ),
        ),
      ),
    );
  }
}