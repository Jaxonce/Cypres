import 'dart:convert';

import 'package:cypres/controllers/event-list-page-controller.dart';
import 'package:cypres/model/event_model.dart';
import 'package:cypres/widget/event/event-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

import '../model/contact_model.dart';
import '../model/user_model.dart';

final GetIt _getIt = GetIt.instance;

class EventPage extends StatefulWidget {
  final EventListPageController controller = EventListPageController();

  EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  String? base64Image;
  late UserModel userModel;
  late Image profileImage;
  late List<EventModel> events;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final ContactModel contact =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    events = widget.controller.getEvents(userModel.id, contact.id);

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
                    onPressed: () async {
                      final newEvent =
                          await Navigator.pushNamed(context, "/event-add");
                      if (newEvent != null) {
                        setState(() {
                          widget.controller.addEvent(newEvent as EventModel);
                        });
                      }
                    },
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
            largeTitle: SuperLargeTitle(
                largeTitle: "Calendar",
                textStyle: const TextStyle(
                    inherit: false,
                    fontFamily: '.SF Pro Display',
                    fontSize: 34.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.41,
                    color: CupertinoColors.white))),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff051f13),
                Color.fromRGBO(27, 60, 22, 0)
              ], // Couleurs de votre dégradé
            ),
          ),
          child: CupertinoPageScaffold(
              backgroundColor: Colors.transparent,
              child: getBody(events, contact)),
        ));
  }

  Future<String> convertImageToBase64(String path) async {
    ByteData data = await rootBundle.load(path);
    List<int> bytes = data.buffer.asUint8List();
    return base64Encode(Uint8List.fromList(bytes));
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Widget getBody(List<EventModel> events, ContactModel contact) {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        itemCount: widget.controller.getEvents(userModel.id, contact.id).length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: EventItem(
                  event: EventModel(
                      events[index].id,
                      events[index].name,
                      events[index].description,
                      events[index].location,
                      events[index].beginDate,
                      events[index].endDate,
                      events[index].creator),
                  onUpdated: () {
                    setState(() {});
                  }));
        });
  }

  void _loadUser() async {
    userModel = await widget.controller.connectUser();
    base64Image = userModel.profilePictureBytes.toString();
    if (base64Image != null) {
      profileImage = imageFromBase64String(base64Image!);
    }
  }
}
