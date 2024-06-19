import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:super_cupertino_navigation_bar/models/super_appbar.model.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SuperScaffold(
        appBar: SuperAppBar(
          title: const Text("Gallery"),
          searchBar: SuperSearchBar(enabled: false),
          backgroundColor: Color(0xff051f13).withOpacity(0.5),
          largeTitle: SuperLargeTitle(enabled: true, largeTitle: "Gallery", textStyle: const TextStyle(inherit: false, fontFamily: '.SF Pro Display', fontSize: 34.0, fontWeight: FontWeight.w700, letterSpacing: 0.41, color: CupertinoColors.white),),
        ),
          body: CupertinoPageScaffold(
            child: getBody(screenWidth)
          ),
    );
  }
}

Widget getBody(double screenWidth) {
  return SingleChildScrollView(
    padding: EdgeInsets.all(0),
    child: Wrap(
      spacing: screenWidth/120,
      runSpacing: screenWidth/120,
      children: List.generate(100, (index) {
        return Container(
          height: 75.5,
          width: 75.5,
          color: CupertinoColors.systemRed,
        );
      }),
    )
  );
}

// ListView(
// children: [
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemRed,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemBlue,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemGreen,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemYellow,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemPink,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemPurple,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemOrange,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemIndigo,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemTeal,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemBrown,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemGrey,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemBlue,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemGreen,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemYellow,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemPink,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemPurple,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemOrange,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemIndigo,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemTeal,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemBrown,
// ),
// Container(
// height: 75.5,
// width: 75.5,
// color: CupertinoColors.systemGrey,
// ),
// ],
// );


getTabBar() {
}
