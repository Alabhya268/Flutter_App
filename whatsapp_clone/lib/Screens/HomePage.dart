import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Services/AuthenticationService.dart';
import 'package:whatsapp_clone/main.dart';
import 'ChatScreen.dart';

class HomePage extends StatelessWidget {
  AuthenticationService _authenticationService = AuthenticationService();

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
                      child: Text('Starred messages'),
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton(
                      onPressed: () {
                        //             Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SettingsPage()),
                        // );
                      },
                      child: Text('Settings'),
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton(
                      child: Text('Sign Out'),
                      onPressed: () {
                        _authenticationService.signOut();
                        _authenticationService.authStateChanges
                            .listen((User user) {
                          if (user == null) {
                            print('User is currently signed out!');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          } else {
                            print('Failed to Sign Out!');
                          }
                        });
                      },
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
