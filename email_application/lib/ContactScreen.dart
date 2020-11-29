import 'dart:ui';

import 'model/Contact.dart';
import 'package:email_application/AppDrawer.dart';
import 'package:email_application/ContactManager.dart';
import 'package:email_application/model/Contact.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  ContactManager manager = ContactManager();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contact'),
          actions: [
            Chip(
              label: StreamBuilder<int>(
                stream: manager.ContactCounter,
                builder: (context, snapshot) {
                  return Text(
                    (snapshot.data ?? 0).toString(),
                    style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  );
                }
              ),
              backgroundColor: Colors.deepOrange,
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: StreamBuilder<List<Contact>>(
            stream: manager.contactListView,
            builder: (context, snapshot) {
              List<Contact> contacts = snapshot.data;
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  Contact _contact = contacts[index];
                  return ListTile(
                    leading: CircleAvatar(),
                    subtitle: Text(_contact.email),
                    title: Text(_contact.name),
                  );
                },
                itemCount: contacts?.length ?? 0,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              );
            }),
      ),
    );
  }
}