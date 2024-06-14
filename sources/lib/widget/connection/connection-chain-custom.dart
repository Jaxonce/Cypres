import 'package:cypres/utils/local_storage_service.dart';
import 'package:cypres/widget/connection/custom-textfield.dart';
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
  final AuthenticationController controller = _getIt.get<AuthenticationController>();

  late var newNextRoute;

  late var userBuilder;

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculer le pourcentage pour le padding
    const double paddingPercentage = 0.12; // 10% de la taille de l'écran
    final double paddingValue = screenHeight * paddingPercentage;

    //permet de récupérer les arguments passés à la page pour construire le user
    userBuilder =
    ModalRoute.of(context)!.settings.arguments;

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
                  text: widget.hintText, obscureText: widget.isPassword, keyboardType: widget.type, controller: textController,),
              SizedBox(height: paddingValue / 2.5),
              // Espacement entre le texte et le bouton
              BigButton(
                text: widget.buttonText,
                onPressed: () async {
                  UserModel user;
                  if (userBuilder != null) {
                    user = userBuilder as UserModel;
                  } else {
                    user = UserModel("","","","","","");
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
                  if (widget.field == Field.mail) {
                    await isUserExist(user.mailAddress);
                  }
                  if (widget.field == Field.password) {
                    if (widget.isConnection) {
                      await getAndSaveToken(user.mailAddress,user.password);
                    } else {
                      await register(user);
                    }
                  }
                  Navigator.pushNamed(context, newNextRoute, arguments: user);
                },
              ),
              // Espacement entre le bouton et le texte
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getAndSaveToken(String email, String password) async {
    String token = await controller.login(email, password);

    saveToken(token);
  }

  Future<void> register(UserModel user) async {
    UserModel userModel = await controller.register(UserDTO.POCOToDTO(user));

    getAndSaveToken(userModel.mailAddress, userModel.password);
  }

  Future<void> isUserExist(String email) async {
    await controller.isUserExist(email).then((value) {
      if (value) {
        setState(() {
          newNextRoute = '/connection/password';
        });
      }
    });
  }
}
