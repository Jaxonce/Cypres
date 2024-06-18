import 'dart:async';

import 'package:cypres/utils/hash_password_utils.dart';
import 'package:cypres/utils/local_storage_service.dart';
import 'package:cypres/widget/connection/custom-textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/authentication-controller.dart';
import '../../data/DTOs/user_dto.dart';
import '../../model/user_model.dart';
import 'big-button.dart';

final GetIt _getIt = GetIt.instance;

enum Field {lastname, firstname, mail, password}

class ConnectionChainCustom extends StatefulWidget {
  final String title;
  final String hintText;
  final String nextRoute;
  final String buttonText;
  final bool isPassword;
  final bool isConnection;
  final TextInputType type;
  final Field field;

  const ConnectionChainCustom({super.key,
    required this.title,
    required this.hintText,
    required this.nextRoute,
    this.buttonText = "Continuer",
    this.isPassword = false,
    this.type = TextInputType.text,
    this.isConnection = false,
    required this.field
  });

  @override
  State<ConnectionChainCustom> createState() => _ConnectionChainCustomState();
}

class _ConnectionChainCustomState extends State<ConnectionChainCustom> {
  final AuthenticationController controller = AuthenticationController();

  late var newNextRoute;

  late var userBuilder;

  bool showError = false;
  String errorMessage = "";

  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculer le pourcentage pour le padding
    const double paddingPercentage = 0.12; // 10% de la taille de l'écran
    final double paddingValue = screenHeight * paddingPercentage;

    //permet de récupérer les arguments passés à la page pour construire le user
    userBuilder = ModalRoute.of(context)!.settings.arguments;

    newNextRoute = widget.nextRoute;

    return CupertinoPageScaffold(
      child: Container(
        padding: EdgeInsets.only(top: paddingValue, left: 35, right: 35),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffb051F13),
              Color.fromRGBO(27, 60, 22, 0)
            ], // Couleurs de votre dégradé
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 26,
                  color: Color(0xffE1E1E1),
                  // Couleur du texte
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              SizedBox(height: paddingValue / 1.4),
              // Espacement entre l'image et le texte
              CustomTextField(
                text: widget.hintText,
                obscureText: widget.isPassword,
                keyboardType: widget.type,
                controller: textController,
              ),
              SizedBox(
                  height: !showError ? paddingValue / 2.5 : paddingValue / 4),
              // Espacement entre le texte et le bouton
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: showError ? screenWidth / 6.2 : 0,
                child: showError
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemRed.withOpacity(0.5),
                          borderRadius:
                              BorderRadius.circular(screenWidth / 6.1),
                        ),
                        child: Text(
                          errorMessage,
                          style: const TextStyle(color: CupertinoColors.white),
                        ),
                      )
                    : null,
              ),
              SizedBox(height: showError ? paddingValue / 4 : 0),
              BigButton(
                text: widget.buttonText,
                onPressed: verifyAndValidateField,
              ),
              // Espacement entre le bouton et le texte
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyAndValidateField() async {
    UserModel user;
    if (userBuilder != null) {
      user = userBuilder as UserModel;
    } else {
      user = UserModel("", "", "", "", null, "");
    }
    switch (widget.field) {
      case Field.lastname :
        user.lastname = textController.text;
      case Field.firstname :
        user.firstname = textController.text;
      case Field.mail :
        user.mailAddress = textController.text;
      case Field.password :
        user.password = textController.text;
    }
    if(await validateField(user)) {
      if (widget.field == Field.password) {
        if (widget.isConnection) {
          await getAndSaveToken(user.mailAddress, user.password);
        } else {
          await register(user);
        }
      }
      Navigator.pushNamed(context, newNextRoute, arguments: user);
    }
    Timer(Duration(seconds: 3), () {
      setState(() {
        showError = false;
      });
    });
  }

  bool isValidPassword(String password) {
    final RegExp passwordRegExp = RegExp(r'^(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(password);
  }

  Future<bool> validateField(UserModel user) async {
    if (textController.text.isEmpty) {
      setState(() {
        showError = true;
        errorMessage = "Ce champ ne peut pas être vide";
      });
      return false;
    }
    if (widget.field == Field.password && !isValidPassword(user.password)) {
      setState(() {
        showError = true;
        errorMessage = "Le mot de passe doit contenir au moins 8 caractères, un chiffre et un caractère spécial";
      });
      return false;
    }
    if (widget.field == Field.mail && EmailValidator.validate(user.mailAddress)) {
      await isUserExist(user.mailAddress);
      return true;
    } else if (widget.field == Field.mail) {
      setState(() {
        showError = true;
        errorMessage = "Adresse mail invalide";
      });
      return false;
    } else {
      return true;
    }
  }

  Future<void> getAndSaveToken(String email, String password) async {
    String token = await controller.login(email, password);
    saveToken(token);
    UserDTO userConnected = await controller.connect(email);
    UserModel.getInstance()!.id = userConnected.id;
    UserModel.getInstance()!.firstname = userConnected.firstname;
    UserModel.getInstance()!.lastname = userConnected.lastname;
    UserModel.getInstance()!.mailAddress = userConnected.mailAddress;
    UserModel.getInstance()!.password = userConnected.password;
    //UserModel.getInstance()?.profilePictureBytes = userConnected.profilePictureBase64;
  }

  Future<void> register(UserModel user) async {
    await controller.register(UserDTO.POCOToDTO(user));

    getAndSaveToken(user.mailAddress, user.password);
  }

  Future<void> isUserExist(String email) async {
    await controller.isUserExist(email).then((value) {
      if (value) {
        setState(() {
          newNextRoute = '/connection/password';
        });
      } else {
        setState(() {
          newNextRoute = '/signup/lastname';
        });
      }
    });
  }
}
