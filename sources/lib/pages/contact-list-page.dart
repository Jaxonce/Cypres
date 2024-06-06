import 'package:cypres/widget/contact/contact-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

import '../controllers/contact-list-page-controller.dart';
import '../model/contact_model.dart';

final GetIt _getIt = GetIt.instance;

class ContactPage extends StatefulWidget {
  final ContactListPageController controller =
      _getIt.get<ContactListPageController>();

  ContactPage({
    super.key,
  });

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<ContactModel> _contacts = [];

  Future<void> _loadContacts() async {
    List<ContactModel> tmp = await widget.controller.getContacts();

    setState(() {
      _contacts = tmp;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
        appBar: SuperAppBar(
            title: const Text("Messages"),
            actions: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                    onPressed: addContact(),
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
            largeTitle: SuperLargeTitle(enabled: false)),
        body: Container(
            decoration: const BoxDecoration(color: Color(0xff06180E)),
            child: CupertinoPageScaffold(
                backgroundColor: Colors.transparent, child: getBody())));
  }

  Widget getBody() {
    return ListView.builder(
      itemCount: _contacts.length,
      itemBuilder: (context, index) {
        return ContactItem(contact: _contacts[index]);
      },
    );
  }

  addContact() {}
}
