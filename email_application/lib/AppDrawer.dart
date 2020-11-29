import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text('Testmail@email.com'),
            accountName: Text('Alabhya'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars2.githubusercontent.com/u/57143358?s=400&u=4d080b70a37b93171804f91ac2cd3fdbea951846&v=4'),
            ),
            otherAccountsPictures: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(title: Text('Adding new account...')),
                  );
                },
                child: CircleAvatar(child: Icon(Icons.add)),
              ),
            ],
          ),
          ListTile(
            title: Text("Inbox"),
            trailing: Chip(
              label: Text(
                '11',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            leading: Icon(FontAwesomeIcons.inbox),
          ),
          ListTile(
            title: Text("Draft"),
            leading: Icon(FontAwesomeIcons.edit),
          ),
          ListTile(
            title: Text("Archive"),
            leading: Icon(FontAwesomeIcons.archive),
          ),
          ListTile(
            title: Text("Sent"),
            leading: Icon(FontAwesomeIcons.paperPlane),
          ),
          ListTile(
            title: Text("Trash"),
            leading: Icon(FontAwesomeIcons.trash),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(FontAwesomeIcons.cog),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
