import 'package:cypres/controllers/event-list-page-controller.dart';
import 'package:cypres/model/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

final GetIt _getIt = GetIt.instance;

class EventItem extends StatefulWidget {
  final EventModel event;
  final EventListPageController controller = EventListPageController();
  final Function? onUpdated;

  EventItem({super.key, required this.event, this.onUpdated});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  TextStyle getTextStyle() {
    return TextStyle(fontSize: 14);
  }

  @override
  Widget build(BuildContext context) {
    final Tween<double> _widthTween = Tween<double>(begin: 77, end: 90);
    Animation<double> _boxDecorationAnimation(Animation<double> animation) {
      return _widthTween.animate(CurvedAnimation(
          parent: animation,
          curve: Interval(0, CupertinoContextMenu.animationOpensAt)));
    }

    return CupertinoContextMenu.builder(
        actions: <Widget>[
          CupertinoContextMenuAction(
              onPressed: () async {
                await Navigator.pushNamed(context, "/event/edit",
                    arguments: widget.event);
                widget.onUpdated!();
                Navigator.pop(context);
              },
              trailingIcon: CupertinoIcons.pencil,
              child: Text("Edit")),
          CupertinoContextMenuAction(
              onPressed: () async {
                widget.controller.deleteEvent(widget.event.id);
                widget.onUpdated!();
                Navigator.pop(context);
              },
              trailingIcon: CupertinoIcons.delete,
              isDestructiveAction: true,
              child: Text("Delete"))
        ],
        builder: (BuildContext context, Animation<double> animation) {
          final Animation<double> boxDecorationAnimation =
              _boxDecorationAnimation(animation);
          return Container(
              width: 341,
              height: animation.value < CupertinoContextMenu.animationOpensAt
                  ? boxDecorationAnimation.value
                  : null,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  border: const Border(
                      left:
                          BorderSide(color: CupertinoColors.white, width: 10)),
                  color: const Color(0xff609E81).withOpacity(0.95),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff75958B).withOpacity(0.25),
                        blurRadius: 16,
                        offset: const Offset(2, 2))
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.event.name, style: getTextStyle()),
                    Text(
                      widget.event.location,
                      style: getTextStyle(),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(widget.event.beginDate) +
                          " " +
                          DateFormat.jm().format(widget.event.beginDate) +
                          " to " +
                          DateFormat.jm().format(widget.event.endDate),
                      style: getTextStyle(),
                    )
                    // Text("Rendez-vous banque"),
                    // Text("Crédit Mutuel Centre Stéphanois"),
                    // Text("Friday 22 Septembre from 10:00 to 12:00"),
                  ],
                ),
              ));
        });
  }
}
