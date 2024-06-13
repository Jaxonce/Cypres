import 'dart:convert';
import 'dart:typed_data';

import 'package:cypres/controllers/event-list-page-controller.dart';
import 'package:cypres/data/DTOs/user_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

import '../model/user_model.dart';

final GetIt _getIt = GetIt.instance;

class EventPage extends StatefulWidget {
  final EventListPageController controller = _getIt.get<EventListPageController>();

  EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {


  String? base64Image;
  late UserModel userModel;
  late Image profileImage;

  @override
  void initState() {
    super.initState();
    userModel = widget.controller.connectUser();
    base64Image = userModel.profilePictureBase64;
    if (base64Image != null) {
      profileImage = imageFromBase64String(base64Image!);
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculer le pourcentage pour le padding
    const double paddingPercentage = 0.12; // 10% de la taille de l'écran
    final double paddingValue = screenHeight * paddingPercentage;

    return SuperScaffold(
        appBar: SuperAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: profileImage.image,
              ),
              const SizedBox(width: 8),
              Padding(
                padding: EdgeInsets.only(right: paddingValue / 2.5),
                child: Text(userModel.firstname,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontStyle: FontStyle.normal)),
              )
              //change the text 'My contact '+ remove const when we pass a message in the page
            ],
          ),
          actions: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                  onPressed: addEvent(),
                  child: const Icon(
                    CupertinoIcons.add,
                    color: CupertinoColors.activeBlue,
                  ))
            ],
          ),
            backgroundColor: const Color(0xff06180E),
            border: const Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.15), width: 1)),
            largeTitle: SuperLargeTitle(largeTitle: "Calendar", textStyle: const TextStyle(inherit: false, fontFamily: '.SF Pro Display', fontSize: 34.0, fontWeight: FontWeight.w700, letterSpacing: 0.41, color: CupertinoColors.white))),
        );
  }

  Future<void> convertImageToBase64() async {
    ByteData data = await rootBundle.load('assets/Flag_of_France.png');
    List<int> bytes = data.buffer.asUint8List();
    String imageBase64 = base64Encode(Uint8List.fromList(bytes));

    setState(() {
      base64Image = imageBase64;
    });
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  addEvent() {}
}
