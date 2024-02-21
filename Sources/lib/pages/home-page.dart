import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter_vue/widget/big-button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculer le pourcentage pour le padding
    const double paddingPercentage = 0.12; // 10% de la taille de l'écran
    final double paddingValue = screenHeight * paddingPercentage;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: paddingValue, left: 35, right:35),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffb051f13), Color.fromRGBO(27, 60, 22, 0)], // Couleurs de votre dégradé
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/cypres_logo.svg',
                width: 210, // Largeur de l'image
                height: 170, // Hauteur de l'image
                alignment: Alignment.center,
              ),
              SizedBox(height: paddingValue/1.4), // Espacement entre l'image et le texte
              const Text(
                'Bienvenue,\n'
                    'Prêt à partager des\n'
                    'choses innoubliables ?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 26,
                  color: Color(0xffE1E1E1), // Couleur du texte
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              SizedBox(height: paddingValue/1.4), // Espacement entre le texte et le bouton
              BigButton(
                text: 'Créer son compte',
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
              SizedBox(height: paddingValue/4.5), // Espacement entre le bouton et le texte
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/connection');
                },
                child: const Text(
                  'Se connecter',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffD7E2D6), // Couleur du texte
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), // Espacement entre le bouton et le texte
            ],
          ),
        ),
      ),
    );
  }
}