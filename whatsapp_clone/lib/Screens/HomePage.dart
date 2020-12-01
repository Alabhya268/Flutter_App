import 'package:flutter/material.dart';
import 'ChatScreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: TextButton(
                      onPressed: () {},
                      child: Text('New group'),
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton(
                      onPressed: () {},
                      child: Text('New broadcast'),
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton(
                      onPressed: () {},
                      child: Text('WhatsApp Web'),
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Starred messages'),
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Settings'),
                    ),
                  ),
                ];
              },
            )
          ],
          bottom: TabBar(tabs: [
            Tab(
                icon: Icon(
              Icons.camera_alt,
            )),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ]),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            String item = 'Item $index';
            return ListTile(
              title: Text(item),
              leading: Container(
                child: IconButton(
                  icon: CircleAvatar(),
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                ),
              ),
              subtitle: Text('Subtitle for $item'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ChatScreen(
                      title: item,
                    ),
                  ),
                );
              },
            );
          },
          itemCount: 20,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: () {},
        ),
      ),
    );
  }
}
