import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPopUpSurface extends StatelessWidget {

  const CustomPopUpSurface({Key? key})
      : super(key: key);

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
                  height: screenHeight/5,
                  child: Stack(
                    children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                            child: const Text("Apps", style: TextStyle(fontSize: 20),),
                          ),
                        ),
                        Align(
                          alignment:
                          Alignment.topRight,
                          child: CupertinoButton(
                              child: Icon(
                                  CupertinoIcons.xmark_circle_fill,
                                  color: CupertinoColors.systemGrey,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        )
                  ]
                  )
              ),
            )
        )
    );
  }
}


