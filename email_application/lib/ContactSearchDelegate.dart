import 'package:email_application/ContactListBuilder.dart';
import 'package:email_application/ContactManager.dart';
import 'package:email_application/Provider.dart';
import 'package:flutter/material.dart';

import 'model/Contact.dart';

class ContactSearchDelegate extends SearchDelegate {
  final manager;

  ContactSearchDelegate({this.manager});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ContactManager manager = Provider.of(context);
    if (query.length < 3) {
      return Center(
        child: Text('Type atleast 3 letters'),
      );
    }

    return ContactListBuilder(
      builder: (context, contacts) {
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
              separatorBuilder: (BuildContext context, int index) => Divider(),
            );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
