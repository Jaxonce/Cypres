import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:test_flutter_vue/widget/big-button.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();

}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    // Calculer le pourcentage pour le padding
    const double paddingPercentage = 0.12; // 10% de la taille de l'écran
    final double paddingValue = screenHeight * paddingPercentage;

    return CupertinoPageScaffold(
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffb051f13),
                  Color.fromRGBO(27, 60, 22, 0)
                ], // Couleurs de votre dégradé
              ),
              image: DecorationImage(
                  image: Svg('assets/bg_multiple_icon.svg',),
                  fit: BoxFit.cover
              ),
            )
        )
    );
  }
}