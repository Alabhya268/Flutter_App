import 'package:email_application/ContactManager.dart';
import 'package:email_application/Provider.dart';
import 'package:email_application/model/Contact.dart';
import 'package:flutter/material.dart';

class ContactListBuilder extends StatelessWidget {
  final Function builder;

  const ContactListBuilder({this.builder});
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context);
    return StreamBuilder<List<Contact>>(
      stream: manager.contactListView,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            List<Contact> contacts = snapshot.data;
            return builder(context, contacts);
        }
      },
    );
  }
}
