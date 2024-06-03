import 'package:cypres/controllers/event-list-page-controller.dart';
import 'package:cypres/model/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

final GetIt _getIt = GetIt.instance;

class EventItem extends StatefulWidget {
  final EventModel event;
  final EventListPageController controller =
      _getIt.get<EventListPageController>();

  EventItem({super.key, required this.event});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  TextStyle getTextStyle() {
    return TextStyle(fontSize: 14);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 341,
        height: 77,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            border: const Border(
                left: BorderSide(color: CupertinoColors.white, width: 10)),
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
  }
}
