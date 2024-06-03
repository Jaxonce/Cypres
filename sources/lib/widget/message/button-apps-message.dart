import 'package:cypres/model/contact_model.dart';
import 'package:flutter/cupertino.dart';

import '../../model/member_model.dart';

class ButtonAppsMessage extends StatefulWidget {
  final Icon icon;
  final String appName;
  final String route;
  final ContactModel contact;

  const ButtonAppsMessage(
      {super.key,
      required this.icon,
      required this.appName,
      required this.route,
      required this.contact});

  @override
  State<ButtonAppsMessage> createState() => _ButtonAppsMessageState();
}

class _ButtonAppsMessageState extends State<ButtonAppsMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, widget.route,
                  arguments: widget.contact);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(13)),
                  border:
                      Border.all(color: const Color(0xff38433E), width: 0.5),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff10492d), Color(0x30474d46)],
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff3D5644).withOpacity(0.25),
                        blurRadius: 9,
                        offset: const Offset(2, 2))
                  ]),
              width: 60,
              height: 60,
              child: widget.icon,
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            widget.appName,
            style: const TextStyle(
                fontSize: 12,
                fontFamily: "SFProDisplay",
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
