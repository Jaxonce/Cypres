import 'package:cypres/controllers/event-add-controller.dart';
import 'package:cypres/model/event_model.dart';
import 'package:cypres/widget/event/date-picker-field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

final GetIt _getIt = GetIt.instance;

class EditEventPage extends StatefulWidget {
  final EventAddController controller = _getIt.get<EventAddController>();

  EditEventPage({super.key});

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  DateTime beginDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(hours: 1));
  bool switchValue = true;
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  var titlePage = "Add";

  @override
  void dispose() {
    super.dispose();

    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var oldEvent = ModalRoute.of(context)!.settings.arguments;
    if (oldEvent != null) {
      oldEvent as EventModel;
      titleController.text = oldEvent.name;
      descriptionController.text = oldEvent.description;
      locationController.text = oldEvent.location;
      beginDate = oldEvent.beginDate;
      endDate = oldEvent.endDate;
      switchValue = oldEvent.sync;
      titlePage = "Edit";
    }
    return SuperScaffold(
        appBar: SuperAppBar(
            title: Text("${titlePage} Event"),
            searchBar: SuperSearchBar(
              // height: 190,
              enabled: false,
              scrollBehavior: SearchBarScrollBehavior.pinned,
              resultBehavior: SearchBarResultBehavior.neverVisible,
            ),
            largeTitle: SuperLargeTitle(enabled: false),
            backgroundColor: const Color(0xff06180E),
            border: const Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.15), width: 1)),
            actions: CupertinoButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  print("Form valid");
                  endDate = DateTime(
                      beginDate.year,
                      beginDate.month,
                      beginDate.day,
                      endDate.hour,
                      endDate.minute,
                      endDate.second,
                      endDate.millisecond,
                      endDate.microsecond);
                  final event = EventModel(
                      "",
                      titleController.text,
                      descriptionController.text,
                      locationController.text,
                      beginDate,
                      endDate,
                      await widget.controller.connectUser(),
                      switchValue);
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text("Ajout en cours...")));
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (oldEvent != null) {
                    oldEvent as EventModel;
                    widget.controller.editEvent(oldEvent, event);
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context, event);
                  }
                  //Fluttertoast.showToast(msg: "Event add succesfully");
                }
              },
              child: Text(titlePage,
                  style: TextStyle(color: CupertinoColors.activeBlue)),
              disabledColor: CupertinoColors.inactiveGray,
            )),
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
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CupertinoFormSection.insetGrouped(
                      backgroundColor: CupertinoColors.white.withOpacity(0),
                      decoration: const BoxDecoration(
                          color: Color(0xff0D4028),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      children: [
                        CupertinoTextFormFieldRow(
                          textInputAction: TextInputAction.next,
                          prefix: Text("Title"),
                          validator: (title) => (title == null || title.isEmpty)
                              ? 'Enter a name'
                              : null,
                          controller: titleController,
                        ),
                        CupertinoTextFormFieldRow(
                          textInputAction: TextInputAction.next,
                          prefix: Text("Description"),
                          controller: descriptionController,
                        ),
                        CupertinoTextFormFieldRow(
                          prefix: Text("Place"),
                          controller: locationController,
                        ),
                      ],
                    ),
                    CupertinoFormSection.insetGrouped(
                      backgroundColor: CupertinoColors.white.withOpacity(0),
                      decoration: const BoxDecoration(
                          color: Color(0xff0D4028),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      children: [
                        CupertinoFormRow(
                            prefix: Text("Date"),
                            child: DatePickerField(
                              date: beginDate,
                              setDate: (DateTime newDate) {
                                setState(() {
                                  beginDate = newDate;
                                });
                              },
                            )),
                        CupertinoFormRow(
                            prefix: Text("Time"),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DatePickerField(
                                  date: beginDate,
                                  setDate: (DateTime newDate) {
                                    setState(() {
                                      beginDate = newDate;
                                    });
                                  },
                                  showDayOfWeek: false,
                                  use24hFormat: false,
                                  mode: CupertinoDatePickerMode.time,
                                ),
                                DatePickerField(
                                  date: endDate,
                                  setDate: (DateTime newDate) {
                                    setState(() {
                                      endDate = newDate;
                                    });
                                  },
                                  showDayOfWeek: false,
                                  use24hFormat: false,
                                  mode: CupertinoDatePickerMode.time,
                                )
                              ],
                            )),
                      ],
                    ),
                    CupertinoFormSection.insetGrouped(
                      backgroundColor: CupertinoColors.white.withOpacity(0),
                      decoration: BoxDecoration(
                          color: CupertinoColors.white.withOpacity(0),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      children: [
                        CupertinoFormRow(
                          prefix: Text("Sync Now"),
                          child: CupertinoSwitch(
                              value: switchValue,
                              onChanged: (bool? value) {
                                setState(() {
                                  switchValue = value ?? false;
                                });
                              }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
