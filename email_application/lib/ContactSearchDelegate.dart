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
        onPressed: () {},
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
    if (query.length < 3) {
      return Center(
        child: Text('Type atleast 3 letters'),
      );
    }
    return StreamBuilder<List<Contact>>(
      stream: manager.filteredCollection(query: query),
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
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
