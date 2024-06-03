import 'package:cypres/model/contact_model.dart';
import 'package:cypres/widget/message/button-apps-message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/member_model.dart';

class CustomPopUpSurface extends StatelessWidget {
  final List<MemberModel> conversationMembers;

  const CustomPopUpSurface({Key? key, required this.conversationMembers})
      : super(key: key);

  ContactModel? getContact() {
    for (var member in conversationMembers) {
      if (member is ContactModel) {
        return member as ContactModel;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
        onVerticalDragStart: (details) {},
        onVerticalDragUpdate: (details) {},
        onVerticalDragEnd: (details) {
// Si le mouvement de glissement vers le bas est terminé, fermer le popup
          if (details.primaryVelocity! > 0.2) {
            Navigator.of(context).pop();
          }
        },
        child: Dismissible(
            key: Key('popup'),
            direction: DismissDirection.down,
            child: CupertinoPopupSurface(
              isSurfacePainted: false,
              child: Container(
                color: const Color(0xff181818),
                alignment: Alignment.center,
                width: double.infinity,
                height: screenHeight / 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: const Text(
                            "Apps",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                        CupertinoButton(
                            child: Icon(
                              CupertinoIcons.xmark_circle_fill,
                              color: CupertinoColors.systemGrey,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonAppsMessage(
                            icon: Icon(CupertinoIcons.calendar,
                                color: Colors.white.withOpacity(0.53),
                                size: 35),
                            appName: "Calendar",
                            route: "/event",
                            contact: getContact()!),
                        ButtonAppsMessage(
                            icon: Icon(CupertinoIcons.photo,
                                color: Colors.white.withOpacity(0.53),
                                size: 35),
                            appName: "Gallery",
                            route: "/message",
                            contact: getContact()!),
                        ButtonAppsMessage(
                            icon: Icon(CupertinoIcons.film,
                                color: Colors.white.withOpacity(0.53),
                                size: 35),
                            appName: "Film Library",
                            route: "/message",
                            contact: getContact()!),
                        ButtonAppsMessage(
                            icon: Icon(
                              CupertinoIcons.money_dollar_circle_fill,
                              color: Colors.white.withOpacity(0.53),
                              size: 35,
                            ),
                            appName: "Balance",
                            route: "/message",
                            contact: getContact()!)
                      ],
                    )
                  ],
                ),
                // child: Stack(children: [
                //   Align(
                //     alignment: Alignment.topLeft,
                //     child: Container(
                //       padding:
                //           EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                //       child: const Text(
                //         "Apps",
                //         style: TextStyle(fontSize: 20),
                //       ),
                //     ),
                //   ),
                //   Align(
                //     alignment: Alignment.topRight,
                //     child: CupertinoButton(
                //         child: Icon(
                //           CupertinoIcons.xmark_circle_fill,
                //           color: CupertinoColors.systemGrey,
                //           size: 30,
                //         ),
                //         onPressed: () {
                //           Navigator.of(context).pop();
                //         }),
                //   ),
                //   ButtonAppsMessage()
                // ])
              ),
            )));
  }
}
